#!/bin/bash

cat <<EOF
drdos-help: Summary of Custom Commands

  menu-maker  -> Menu for these commands and more
  copy        -> Copy files with interactive prompt and verbose output.
  move        -> Move/rename files with interactive prompt and verbose output.
  del         -> Delete files with interactive prompt and verbose output.
  cls         -> Clears the terminal screen.
  type        -> Displays file contents using 'bat' with syntax highlighting.
  edit        -> Launches Midnight Commander, a terminal file manager.
  find        -> A user-friendly alternative to 'find' for locating files.
  help        -> Simplified and community-driven man pages.
  attrib      -> Lists file attributes on a Linux file system.
  mem         -> Shows memory usage in human-readable format.
  chkdsk      -> Shows disk space usage in human-readable format.
  tasklist   -> Lists all running processes.
  taskkill    -> Sends a signal (default: TERM) to a process.
  dir         -> Displays a detailed directory listing with color and sorting.
  ddir        -> Same as 'dir', but adds grid layout for compact display.

EOF

