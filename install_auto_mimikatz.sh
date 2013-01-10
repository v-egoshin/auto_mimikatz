mkdir /tmp/Development #download directory
cd /tmp/Development

# copy copy
git clone https://github.com/darkoperator/Metasploit-Plugins.git msf_plugins
git clone https://github.com/darkoperator/Meterpreter-Scripts.git msf_modules

rm -rf msf_plugins/pentest.rb # dirty hack

mv msf_plugins/ ~/.msf4/plugins
mv msf_modules/ ~/.msf4/modules

wget https://raw.github.com/mandreko/metasploit-framework/mimikatz_post/modules/post/windows/gather/mimikatz.rb
sleep 5
mv mimikatz.rb ~/.msf4/modules/post/windows/gather/mimikatz.rb

wget http://blog.gentilkiwi.com/downloads/mimikatz_trunk.zip
unzip mimikatz_trunk.zip -d mimikatz_trunk

mv mimikatz_trunk/Win32/mimikatz.exe /opt/metasploit/msf3/data/post/mimikatz-x86.exe
mv mimikatz_trunk/Win32/sekurlsa.dll /opt/metasploit/msf3/data/post/sekurlsa-x86.dll

mv mimikatz_trunk/x64/mimikatz.exe /opt/metasploit/msf3/data/post/mimikatz-x64.exe
mv mimikatz_trunk/x64/sekurlsa.dll /opt/metasploit/msf3/data/post/sekurlsa-x64.dll
# delete all
<<<<<<< HEAD
cd / && rm -rf /tmp/Development


rm -rf ~/.msf4/plugins
rm -rf ~/.msf4/modules
rm -rf /opt/metasploit/msf3/data/post/mimikatz*
rm -rf /opt/metasploit/msf3/data/post/sekurlsa*
=======
cd / && rm -rf /tmp/Development
>>>>>>> 03e7077780b49c7f75fdc3d46ff95d0e8e915ea0
