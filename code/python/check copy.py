
print("Importing iris module")
# import iris
print("Importing iris module completed")
# This script connects to an IRIS database, executes a simple SQL command, and handles exceptions.
# Importing the iris module for database connection


# def main():
#   connection_string = "host.docker.internal:1972/USER"
#   username = "_system"
#   password = "SYS"

#   connection = iris.connect(connection_string, username, password)
#   print("Connected to IRIS database")
#   cursor = None
#   if connection is None:
#     print("Failed to connect to IRIS database")
#     return
#   print("Creating cursor")  
#   cursor = connection.cursor()
#     if cursor is None:
#         print("Failed to create cursor")
#         return  
    
#     print("Cursor created successfully")
#     print("Executing SQL command")  
#     cursor.execute("SELECT 1")  
#     print("SQL command executed successfully")  
#     print("Checking connection")
#     if connection.is_connected():
#         print("Connection is active")
#   else:
#     print("Connection is not active")
#   print("Closing cursor and connection")
#   if cursor:
#     print("Closing cursor")
#     cursor.close()
#   if connection:
#     print("Closing connection")
#     connection.close()
#   print("Cursor and connection closed successfully")
#   except iris.IrisError as e:
#     print(f"IRIS error: {e}")
#   except Exception as e:
#     print(f"An error occurred: {e}")
#   connection = None
#   cursor = None

#   try:
#     # pass  # do something with DB-API calls
#     print("Connection successful")
#   except Exception as ex:
#     print(ex)
#   finally:
#     if cursor:
#       cursor.close()
#     if connection:
#       connection.close()

# if __name__ == "__main__":
#   main()