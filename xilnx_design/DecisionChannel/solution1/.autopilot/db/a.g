#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/greg/everything/xilnx_design/cycle3/DecisionChannel/solution1/.autopilot/db/a.g.bc ${1+"$@"}
