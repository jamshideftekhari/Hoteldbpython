import mysql.connector


HotelDB = mysql.connector.connect(
    host = "localhost",
    user = "jamshid",
    password = "JAM2003eft",
    database = "hoteldb"
)
print(HotelDB)
mycursor = HotelDB.cursor()
mycursor.execute("SELECT * FROM hotel")
myresults = mycursor.fetchall()
for x in myresults:
    print(x)

  