#!/usr/bin/env bash
# Session picker with a custom order.
# The order is in @btsm-order as session IDs ("$1 $4 $2").
# Sessions not in the order go at the end. Dead IDs are skipped.
# The third field is a marker column: a blue bar for the previous session (name in $BTSM_LAST), a space for others.

list() {
    tmux ls -O index -F '#{session_id}	#{session_name}' | awk -F'\t' -v order="$(tmux show -gv @btsm-order 2>/dev/null)" -v last="$BTSM_LAST" '
        BEGIN { n = split(order, o, " ") }
        { line[$1] = $0 "\t" ($2 == last ? "\033[34m▌\033[0m" : " "); ids[++m] = $1 }
        END {
            for (i = 1; i <= n; i++) if ((o[i] in line) && !(o[i] in seen)) { print line[o[i]]; seen[o[i]] = 1 }
            for (i = 1; i <= m; i++) if (!(ids[i] in seen)) print line[ids[i]]
        }'
}

# Swap session $1 with its neighbor in direction $2 (-1 or 1), save the order, and print the new list.
# At an end of the list, the session wraps to the other end.
move() {
    local lines
    lines=$(list | awk -F'\t' -v id="$1" -v d="$2" '
        { a[NR] = $0; if ($1 == id) p = NR }
        END {
            q = p + d
            if (p && q >= 1 && q <= NR) { t = a[p]; a[p] = a[q]; a[q] = t }
            else if (p && q < 1) { for (i = 2; i <= NR; i++) print a[i]; print a[1]; exit }
            else if (p) { print a[NR]; for (i = 1; i < NR; i++) print a[i]; exit }
            for (i = 1; i <= NR; i++) print a[i]
        }')
    tmux set -g @btsm-order "$(cut -f1 <<<"$lines" | tr '\n' ' ')"
    echo "$lines"
}

# Called by fzf transform: move the cursor by $1 lines, clamped to the list.
page() {
    local p=$((FZF_POS + $1))
    ((p > FZF_MATCH_COUNT)) && p=$FZF_MATCH_COUNT
    ((p < 1)) && p=1
    echo "pos($p)"
}

# Called by fzf transform: close the search, or close the popup if search is not open.
# ponytail: clear-query is in the esc binding, because fzf does not refilter after clear-query from a transform.
esc() {
    if [[ $FZF_INPUT_STATE == hidden ]]; then
        echo abort
    else
        echo "hide-input+rebind(j,k,q,/)"
    fi
}

pick() {
    local self lines current up down
    self="'$0'"
    # ponytail: tmux tracks the previous session per client, so read it here and do not store it.
    export BTSM_LAST
    BTSM_LAST=$(tmux display -p '#{client_last_session}')
    lines=$(list)
    current=$(cut -f1 <<<"$lines" | grep -nxF "$(tmux display -p '#{session_id}')" | cut -d: -f1)
    up="reload-sync($self move {1} -1)"
    down="reload-sync($self move {1} 1)"
    # ponytail: bash, not $SHELL, for fzf commands. fish starts about 6x slower.
    fzf --with-shell 'bash -c' \
        --sync --cycle --no-input --layout=reverse --delimiter='\t' --ansi --with-nth='{3} {2}' --track --id-nth=1 \
        --bind "start:pos(${current:-1})" \
        --bind "k:up,j:down,q:abort" \
        --bind "ctrl-up:$up,ctrl-k:$up,ctrl-down:$down,ctrl-j:$down" \
        --bind "pgup:transform($self page -5),ctrl-u:transform($self page -5)" \
        --bind "pgdn:transform($self page 5),ctrl-d:transform($self page 5)" \
        --bind "/:show-input+unbind(j,k,q,/)" \
        --bind "esc:clear-query+transform($self esc)" \
        --bind "enter:become(tmux switch-client -t {1})" \
        --bind "ctrl-l:become(tmux switch-client -l)" <<<"$lines"
}

case "$1" in
    list) list ;;
    move) move "$2" "$3" ;;
    page) page "$2" ;;
    esc) esc ;;
    *) pick ;;
esac
