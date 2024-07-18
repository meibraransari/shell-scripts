#!/bin/bash

# Argument 1 : Logging level for that command
# Arguments 2... : Command to execute
# Output suppressed if command level >= current logging level 
log()
{
if
  (($1 >= logging_level))
then
  "${@:2}" >/dev/null 2>&1
else
  "${@:2}"
fi
}

logging_level=2

log 1 command1 and its args
log 2 command2 and its args
log 3 command4 and its args
