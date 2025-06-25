import iris

def select(connection):
    # irispy = iris.createIRIS(connection)
    cursor = connection.cursor()
    cursor.execute("select Localisation,count(*) from mecachrome.bons_livraisons group by Localisation")
  
    result=[]
    for i in cursor.fetchall():
        row={i[0]:i[1]}
        result.append(row)
    cursor.close()
    return result
    
def main():
    connection_string = "localhost:1972/irisapp"
    username = "_system"
    password="SYS"
    try:
        connection = iris.connect(connection_string, username, password)
        print("connected")
        result = select(connection)
        return result
    except Exception as err:
        print(err) 
    
    # id = input('ID [1]:') or "1"
    
    # test = irispy.classMethodObject("mecachrome.bonslivraisons", "%ExistsId", id)
    # print(test)
    # help(test)    
    

print(main())