#!/usr/bin/env python3

import os
import signal
import sys
from pathlib import Path

import daemon
import psutil
from daemon.pidfile import PIDLockFile
from inotify_simple import INotify, flags


def cleanup():
    os.remove(pidfile)
    sys.exit()


pidfile = '/tmp/iqutefy.pid'

# check if pidfile refers to dead process
# if so, remove it
if os.path.isfile(pidfile):
    with open(pidfile) as pf:
        pid = int(pf.readline())
    if not psutil.pid_exists(pid):
        os.remove(pidfile)

with daemon.DaemonContext(
        detach_process=False,
        pidfile=PIDLockFile(pidfile),
        signal_map={signal.SIGTERM: cleanup}):
    inotify = INotify()
    watch_flags = flags.CREATE | flags.MODIFY
    wd = inotify.add_watch(sys.argv[1], watch_flags)
    process = psutil.Process()

    # inotify iterator runs out immediately
    while True:
        for event in inotify.read():
            os.system('qutebrowser :config-source')

    # kill after qutebrowser exits
    # not reached on SIGKILL
    cleanup()
