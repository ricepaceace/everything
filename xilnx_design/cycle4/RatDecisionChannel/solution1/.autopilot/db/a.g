#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/greg/everything/xilnx_design/cycle4/RatDecisionChannel/solution1/.autopilot/db/a.g.bc ${1+"$@"}
