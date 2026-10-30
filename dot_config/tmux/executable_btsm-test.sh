#!/usr/bin/env bash
# Check list/move/page/esc on an isolated tmux server. Run: ./btsm-test.sh
set -e
S="$(cd "$(dirname "$0")" && pwd)/btsm.sh"
t() { tmux -L btsm-test -f /dev/null "$@"; }
r() { t run-shell "'$S' $*"; }
names() { r list | cut -f2 | tr '\n' ' '; }
check() { [[ "$1" == "$2" ]] || { echo "FAIL: got '$1' want '$2'"; t kill-server; exit 1; }; }
trap 't kill-server 2>/dev/null' EXIT

t new -ds a
t new -ds b
t new -ds c
check "$(names)" "a b c "

c=$(t display -p -t c '#{session_id}')
r move "'$c'" -1 >/dev/null
r move "'$c'" -1 >/dev/null
check "$(names)" "c a b "
r move "'$c'" -1 >/dev/null
check "$(names)" "a b c "
r move "'$c'" 1 >/dev/null
check "$(names)" "c a b "

t rename -t c z
check "$(names)" "z a b "

t new -ds d
check "$(names)" "z a b d "

t kill-session -t a
check "$(names)" "z b d "

check "$(t run-shell "BTSM_LAST=b '$S' list" | grep -c '▌')" "1"

check "$(FZF_POS=5 FZF_MATCH_COUNT=12 "$S" page 10)" "pos(12)"
check "$(FZF_POS=5 FZF_MATCH_COUNT=12 "$S" page -10)" "pos(1)"
check "$(FZF_POS=1 FZF_MATCH_COUNT=30 "$S" page 10)" "pos(11)"
check "$(FZF_INPUT_STATE=hidden "$S" esc)" "abort"
check "$(FZF_INPUT_STATE=enabled "$S" esc)" "hide-input+rebind(j,k,q,/)"
echo OK
