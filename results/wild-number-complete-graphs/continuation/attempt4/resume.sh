#!/bin/bash
# Resume the A13 cube-and-conquer (skips cubes already UNSAT in cubes/res_*.txt). One solver at a time, nice 19.
cd "$(dirname "$0")"
python3 cuberun.py 0 N 0 100000 1800      || exit 1
python3 cuberun.py 1 N 0 100000 1800 w    || exit 1
python3 cuberun.py 1 H 0 100000 1800 w    || exit 1
echo ALL_DONE
