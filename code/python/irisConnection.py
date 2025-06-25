
import iris

def input_credentials():
    server = input("Enter the server name to connect to (default is localhost): ") or "localhost"
    port = input("Enter the port (default is 1972): ") or 1972
    # input namespace, username, and password
    namespace = input("Enter the namespace (default is SC): ") or "SC"
    username = input("Enter the username (default is _SYSTEM): ") or "_SYSTEM"
    pw = input("Enter the password (default is SYS): ") or "SYS"
    return server, port, namespace, username, pw

def connect_to_iris(server, port, namespace, username, pw):
    args = {
        'hostname':server, 
        'port': port,
        'namespace':namespace, 
        'username':username, 
        'password':pw
    }
    connection = iris.connect(**args)
    return connection

if __name__ == "__main__":
    (server, port, namespace, username, pw) = input_credentials()
    connection = connect_to_iris(server, port, namespace, username, pw)