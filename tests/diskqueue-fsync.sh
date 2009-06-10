# Test for disk-only queue mode (with fsync for queue files)
# This test checks if queue files can be correctly written
# and read back, but it does not test the transition from
# memory to disk mode for DA queues.
# added 2009-06-09 by Rgerhards
# This file is part of the rsyslog project, released  under GPLv3
# uncomment for debugging support:
echo  diskqueue-fsync test seems to have some issues
exit 1
echo testing queue disk-only mode, fsync case
source $srcdir/diag.sh init
source $srcdir/diag.sh startup diskqueue-fsync.conf
# 5000 messages should be enough - the disk fsync test is very slow!
source $srcdir/diag.sh tcpflood 127.0.0.1 13514 1 5000
source $srcdir/diag.sh shutdown-when-empty # shut down rsyslogd when done processing messages
source $srcdir/diag.sh seq-check 0 4999
source $srcdir/diag.sh exit
