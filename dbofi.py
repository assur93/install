import mysql.connector
from datetime import datetime
from datetime import date

mydb = mysql.connector.connect(
  host="localhost",
  user="admin",
  passwd="insega1993",
  database="ofi"
)

mycursor = mydb.cursor()

# 1 Descomentar esta parte y comentar la siguiente para crear una tabla dentro de la BBDD ofi con todos los campos necesarios***********************
  
mycursor.execute("CREATE TABLE customers (tdate TEXT, ttime TEXT, name VARCHAR(255), subname1 VARCHAR(255), subname2 VARCHAR(255), permiso INT)")


mycursor.execute("SHOW TABLES")
for x in mycursor:
  print(x)

# 2 Descomentar esta parte y comentar la anterior para probar que la BBDD funciona correctamente ***************************************************

# tiempo = datetime.now().strftime("%H:%M:%S")
# fecha = datetime.now().strftime("%d/%m/%Y")
# nombre = "Juan Jose"
# apellido1 = "Alfonsin"
# apellido2 = "Perez"
# permiso = 0

# sql = "INSERT INTO customers (tdate, ttime, name, subname1, subname2, permiso) VALUES (%s, %s, %s, %s, %s, %s)"
# val = (fecha, tiempo, nombre, apellido1, apellido2, permiso)
# mycursor.execute(sql, val)

# mydb.commit()

# mycursor.execute("SELECT * FROM customers")

# myresult = mycursor.fetchall()

# for x in myresult:
  # print(x)

  