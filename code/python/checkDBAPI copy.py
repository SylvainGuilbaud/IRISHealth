
import iris

def input_credentials():
    server = input("Enter the server name to connect to (default is localhost): ") or "localhost"
    port = input("Enter the port (default is 1972): ") or 1972
    # input namespace, username, and password
    namespace = input("Enter the namespace (default is SC): ") or "SC"
    username = input("Enter the username (default is _SYSTEM): ") or "_SYSTEM"
    pw = input("Enter the password (default is SYS): ") or "SYS"
    return server, port, namespace, username, pw

def connect_to_iris():
    args = {
        'hostname':server, 
        'port': port,
        'namespace':namespace, 
        'username':username, 
        'password':pw
    }
    connection = iris.connect(**args)
    return connection

def main(): 
    try:
        cursor = connection.cursor()

        print("Cursor created successfully")
        
        cursor.execute("SELECT count(*) FROM SC_Data.salesorder")  
        print("SQL command executed successfully")  
        result = cursor.fetchone()
        print("Number of records in salesorder table:", result[0])
        print("Connection successful")
        
        ## prompt for user input for a table name to query the number of records
        user_input = input("Enter a table name to query the number of records or type 'exit' to quit TABLE: ")
        while user_input.lower() != "exit":
            cursor.execute(f"SELECT count(*) FROM SC_Data.{user_input}")
            result = cursor.fetchone()
            print(f"Number of records in {user_input} table:", result[0])
            user_input = input("Enter a table name to query the number of records or type 'exit' to quit TABLE: ")        
        
        
    except Exception as ex:
        print(ex)
    finally:
        if cursor:
            cursor.close()
        if connection:
            connection.close()

if __name__ == "__main__":
    (server, port, namespace, username, pw) = input_credentials()
    connection = connect_to_iris()
    main()