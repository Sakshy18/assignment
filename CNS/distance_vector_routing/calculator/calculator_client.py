import socket
import sys

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

sock.connect(('127.0.0.1',23000))


while True:

	op=input("Enter the operator:\n")
	sock.send(str.encode(op))
	v=input("Enter the first NO\n")
	sock.send(str.encode(v))
	v2=input("Enter the second NO\n")
	sock.send(str.encode(v2))
	
	data = sock.recv(16)
	dt = data.decode()
	print(dt)
	if "stop."==dt :
		break
	else:			
		print("server: " + dt)

sock.close()
