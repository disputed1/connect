# connect


simple script that will accept either IP or a list of IPs broken apart by line to run commands to.

Example 

root@test:cat list 
10.0.0.1
10.0.0.2
10.0.0.3


root#test:./connect list 'echo "hello world"'
10.0.0.1's password:
hello world
10.0.0.2's password:
hello world
10.0.0.3's password:
hello world
