# make pdbpp start in sticky mode
import pdb
class Config(pdb.DefaultConfig):
    sticky_by_default = True
