require 'fileutils'

puts "\n ==== Install ==== \n\n"

# Dir for black magic
puts "[+] Make temporary directory: /tmp/msf_mimikatz"
FileUtils.cd '/tmp'
FileUtils.mkdir 'msf_mimikatz' unless File.exist? '/tmp/msf_mimikatz'

# Darkoperator's scripts
puts "[+] Clone darkoperator scripts"
out = `git clone https://github.com/darkoperator/Metasploit-Plugins.git msf_plugins 2>&1`
out = `git clone https://github.com/darkoperator/Meterpreter-Scripts.git msf_modules 2>&1`

# This file crash my MSF 4.5
FileUtils.rm 'msf_plugins/pentest.rb' if File.exist? 'msf_plugins/pentest.rb'

# Make config directories
msf = File.expand_path '~/.msf4'
puts "[+] Make/check directories: #{msf + '/plugins'}, #{msf + '/modules'}"
FileUtils.mkdir msf + '/plugins' unless File.exist? msf + '/plugins'
FileUtils.mkdir msf + '/modules' unless File.exist? msf + '/modules'

# Copy scripts
puts "[+] Copy clone repositories"
FileUtils.cp_r Dir.glob('msf_plugins/*'), msf + '/plugins'
FileUtils.cp_r Dir.glob('msf_modules/*'), msf + '/modules'

# Get mimikatz MSF module
puts "[+] Get mimikatz MSF module: https://raw.github.com/mandreko/metasploit-framework/mimikatz_post/modules/post/windows/gather/mimikatz.rb"
out = `wget https://raw.github.com/mandreko/metasploit-framework/mimikatz_post/modules/post/windows/gather/mimikatz.rb  2>&1`
FileUtils.mv 'mimikatz.rb', msf + '/modules/post/windows/gather' if File.exist? 'mimikatz.rb'

# Get fresh mimikatz
puts "[+] Get mimikatz: http://blog.gentilkiwi.com/downloads/mimikatz_trunk.zip"
out = `wget http://blog.gentilkiwi.com/downloads/mimikatz_trunk.zip 2>&1`
out = `unzip -o mimikatz_trunk.zip -d mimikatz_trunk`

puts "[+] Move mimikatz to data folder: /opt/metasploit/msf3/data/post/"
FileUtils.mv 'mimikatz_trunk/Win32/mimikatz.exe', '/opt/metasploit/msf3/data/post/mimikatz-x86.exe'
FileUtils.mv 'mimikatz_trunk/Win32/sekurlsa.dll', '/opt/metasploit/msf3/data/post/sekurlsa-x86.dll'

FileUtils.mv 'mimikatz_trunk/x64/mimikatz.exe', '/opt/metasploit/msf3/data/post/mimikatz-x64.exe'
FileUtils.mv 'mimikatz_trunk/x64/sekurlsa.dll', '/opt/metasploit/msf3/data/post/sekurlsa-x64.dll'

# Waste
puts "[+] Remove temporary directory: /tmp/msf_mimikatz"
FileUtils.cd '/'
FileUtils.rm_rf '/tmp/msf_mimikatz'

puts "[+] Done"

puts "\n\n==== Help ==== "
puts "\nHow to use: \nmsf> load post_auto\nmsf> use auxiliary/scanner/smb/psexec_scanner\nmsf> multi_post -m post/windows/gather/mimikatz -s all"
