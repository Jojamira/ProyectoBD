import mysql.connector as sql
import os
import random
def conec():
    mydb = sql.connect(
        host="localhost",
        user="root",
        password="lascano20",
        database="proyectobd")
    mycursor = mydb.cursor()
    return mycursor,mydb
def Elegirrol():
    print("\t ---------------------------Elegir rol---------------------------------------")
    print("\t1.Pastelero")
    print("\t2.Cliente")
    print("\t3.salir")
def Categorias():
    print("\t ---------------------------Elegir Categorias---------------------------------------")
    print("\t1.Tortas")
    print("\t2.Cheescake")
    print("\t3.Panes")
    print("\t4.Exit")

def Verificacion():
    print("\t ---------------------------Inicio de sesion---------------------------------------")
    print("\t1.Iniciar Sesion")
    print("\t2.Crear cuenta")
    print("\t3.salir")

def crearcuenta(Rol):
    if(Rol=="Pastelero"):
       c,m=conec()
       CedulaPanadero=input("Ingrese su numero de Cedula")
       Nombre = input("Ingrese su nombre")
       Telefono = int(input("Ingrese su Telefono"))
       Correo = input("Ingrese su Correo")
       Contraseña = input("Ingrese su Contraseña")
       Cod_postal= int(input("Ingrese su Cod_postal"))
       numerodelocal = int(input("Ingrese su numero de casa"))
       Calleprincipal = input("Ingrese su Calleprincipal")
       Callesecundaria = input("Ingrese su Callesecundaria")
       sql = "INSERT INTO localizacion (CodigoPostal, Numero, Calle_Principal, Calle_Secundaria) VALUES (%s, %s, %s, %s)"
       val = (Cod_postal, numerodelocal, Calleprincipal, Callesecundaria)
       c.execute(sql, val)
       m.commit()
       sql = "INSERT INTO pastelero (CedulaPanadero, Nombre, telefono, Correo, Contraseña, Cod_postal) VALUES (%s, %s, %s, %s, %s, %s)"
       val = (CedulaPanadero, Nombre, Telefono, Correo, Contraseña, Cod_postal)
       c.execute(sql, val)
       m.commit()

    else:
        c,m = conec()
        Cedula = input("Ingrese su numero de Cedula")
        Nombre = input("Ingrese su nombre")
        Telefono = int(input("Ingrese su Telefono"))
        Correo = input("Ingrese su Correo")
        Contraseña = input("Ingrese su Contraseña")
        sql = "INSERT INTO cliente (Cedula, Nombre, Telefono, Correo, Contraseña) VALUES  (%s, %s, %s, %s, %s)"
        val=(Cedula, Nombre, Telefono, Correo, Contraseña)
        c.execute(sql,val)
        m.commit()

def crearProducto(Id):
       c,m=conec()
       l=[]
       Nombre = input("Ingrese su nombre")
       Canti = int(input("Ingrese su Cantidad"))
       Precio = float(input("Ingrese su Precio"))
       Categorias()
       opcion = int(input("Ingrese una opción:"))
       while opcion != 4:
           if (opcion == 1):
               Categoria = 11111
               id_prod=random.randint(1000, 9999)
               while id_prod in l:
                   id_prod = random.randint(1000, 9999)
               if(id_prod not in l):
                   sql = "INSERT INTO producto (Prod_Id, Nombre, Cantidad, Precio, Id_Cate, pastelero_CedulaPanadero) VALUES (%s, %s, %s, %s, %s, %s)"
                   val = (id_prod, Nombre, Canti, Precio, Categoria, Id)
                   c.execute(sql, val)
                   m.commit()
                   opcion=4

           if (opcion == 2):
               Categoria = 22222
               id_prod = random.randint(1000, 9999)
               while id_prod in l:
                   id_prod = random.randint(1000, 9999)
               if (id_prod not in l):
                   sql = "INSERT INTO producto (Prod_Id, Nombre, Cantidad, Precio, Id_Cate, pastelero_CedulaPanadero) VALUES (%s, %s, %s, %s, %s, %s)"
                   val = (id_prod, Nombre, Canti, Precio, Categoria, Id)
                   c.execute(sql, val)
                   m.commit()
                   opcion=4

           if (opcion == 3):
               Categoria = 32323
               id_prod = random.randint(1000, 9999)
               while id_prod in l:
                   id_prod = random.randint(1000, 9999)
               if (id_prod not in l):
                   sql = "INSERT INTO producto (Prod_Id, Nombre, Cantidad, Precio, Id_Cate, pastelero_CedulaPanadero) VALUES (%s, %s, %s, %s, %s, %s)"
                   val = (id_prod, Nombre, Canti, Precio, Categoria, Id)
                   c.execute(sql, val)
                   m.commit()
                   opcion=4

def run_query(query=''):
    mydb = sql.connect(
        host="localhost",
        user="root",
        password="lascano20",
        database="proyectobd")
    mycursor = mydb.cursor()
    mycursor.execute(query)
    myresult = mycursor.fetchall()
    return myresult



def cargarmenucliente():
    print("\t1.Ver Panaderos Disponibles")
    print("\t2.Realizar Pedido:")
    print("\t3.Consultar Pedidos:")
    print("\t4.Consultar Calificaciones")
    print("\t5.salir")
def cargarmenupanadero():
    print("\t1.Publicar Producto")
    print("\t2.Consultar Producto")
    print("\t3.Consultar Pedidos")
    print("\t4.Salir")
def verpanaderos():
    sqlse = "SELECT pastelero_CedulaPanadero FROM producto"
    panaders=[]
    c, m = conec()
    c.execute(sqlse)
    result = c.fetchall()
    for x in result:
        if(x[0]not in panaders):
           panaders.append(x[0])
    print(panaders)
    for p in panaders:
     sqlse = "SELECT * FROM pastelero where CedulaPanadero =%s"
     c, m = conec()
     c.execute(sqlse, (p,))
     result2 = c.fetchall()
     for i in result2:
            print("Cedula: " + str(i[0]) + "Nombre: " + i[1] + "telefono: " + str(i[2]) + "Correo: " + i[3]
                  + "Cod_postal: " + str(i[5]))
def Realizarpedido(ID):
    verpanaderos()
    opcion = input("Ingrese la cedula del panadero al que desea realizarle el pedido:")
    sqlse = "SELECT * FROM Producto where pastelero_CedulaPanadero =%s"
    c, m = conec()
    c.execute(sqlse, (opcion,))
    result=c.fetchall()
    for x in result:
        sqlse = "SELECT Nombre_categoria FROM categoria where Id_Categoria =%s"
        c, m = conec()
        c.execute(sqlse, (x[4],))
        result2 = c.fetchall()
        for x2 in result2:
         print("ID: " + str(x[0])+ "Nombre: " + x[1]+ "Precio: " + x[3]+ "Categoria: " + x2[0]  )


def cargarcalificaciones(ID):
    sqlse = "SELECT Nota_cali,Comentario,Fecha,Ced_Pas FROM Calificaciones where cliente_Cedula =%s"
    c, m = conec()
    c.execute(sqlse, (ID,))
    result=c.fetchall()
    for x in result:
        print(x)
        sqlse = "SELECT Nombre FROM pastelero where CedulaPanadero =%s"
        c, m = conec()
        c.execute(sqlse, (x[3],))
        result2 = c.fetchall()
        for i in result2:
            print("Nota: "+str(x[0])+"Comentario: "+x[1]+"Fecha: "+str(x[2])+"Pastelero: "+i[0])
def cargarpedido(ID,rol):

    if(rol=="P"):
     sqlse = "SELECT * FROM pedido where pastelero_CedulaPanadero =%s"
     c, m = conec()
     c.execute(sqlse, (ID,))
     result=c.fetchall()
     for x in result:
         sqlse = "SELECT * FROM cliente where Cedula =%s"
         c, m = conec()
         c.execute(sqlse, (x[4],))
         result2 = c.fetchall()
         for i in result2:
             print("ID: " + str(x[0]) + "Fecha: " +str(x[1])  + "Total: " + str(x[2]) + "Estado: " + x[3]+ "cliente: "+i[1]
                   +"N° Cedula: "+i[0])
    if (rol == "C"):
         print("En")
         sqlse = "SELECT * FROM pedido where cliente_Cedula =%s"
         c, m = conec()
         c.execute(sqlse, (ID,))
         result = c.fetchall()
         for x in result:
             sqlse = "SELECT * FROM pastelero where CedulaPanadero =%s"
             c, m = conec()
             c.execute(sqlse, (x[5],))
             result2 = c.fetchall()
             for i in result2:
                 print("ID: " + str(x[0]) + "Fecha: " + str(x[1]) + "Total: " + str(x[2]) + "Estado: " + x[3] + "Pastelero: " +
                       i[1]
                       + "N° Cedula: " + i[0])
def cargarproduc(ID):
    sqlse = "SELECT * FROM Producto where pastelero_CedulaPanadero =%s"
    c, m = conec()
    c.execute(sqlse, (ID,))
    result=c.fetchall()
    for x in result:
        print(x)
def Login():
    r=0
    print("\t ---------------------------Login---------------------------------------")
    ID = str(input("Ingrese su ID:"))
    clave = str(input("Ingrese su clave:"))
    result=run_query("SELECT Cedula,Contraseña FROM cliente")
    result2 = run_query("SELECT CedulaPanadero,Contraseña FROM pastelero")
    for x in result:
        if(ID==x[0] and clave==x[1]):
            cargarmenucliente()
            opcion = int(input("Ingrese una opción:"))
            while opcion != 5:
                if (opcion == 1):
                    verpanaderos()
                    print("\t ---------------------------Bienvenido Cliente---------------------------------------")
                    cargarmenucliente()

                    opcion = int(input("Ingrese una opción:"))
                if (opcion == 2):
                    Realizarpedido(ID)
                    print("\t ---------------------------Bienvenido Cliente---------------------------------------")
                    cargarmenucliente()

                    opcion = int(input("Ingrese una opción:"))
                if (opcion == 3):
                    cargarpedido(ID,"C")
                    print("\t ---------------------------Bienvenido Cliente---------------------------------------")
                    cargarmenucliente()
                    opcion = int(input("Ingrese una opción:"))
                if (opcion == 4):
                    cargarcalificaciones(ID)
                    print("\t ---------------------------Bienvenido Cliente---------------------------------------")
                    cargarmenucliente()
                    opcion = int(input("Ingrese una opción:"))
            r+2

    for x in result2:
        if(ID==x[0] and clave==x[1]):
            print("\t ---------------------------Bienvenido Panadero---------------------------------------")
            cargarmenupanadero()
            opcion = int(input("Ingrese una opción:"))
            while opcion != 4:
                if (opcion == 1):
                    crearProducto(ID)
                    print("\t ---------------------------Bienvenido Panadero---------------------------------------")
                    cargarmenupanadero()


                    opcion = int(input("Ingrese una opción:"))
                if (opcion == 2):
                    cargarproduc(ID)
                    print("\t ---------------------------Bienvenido Panadero---------------------------------------")
                    cargarmenupanadero()
                    opcion = int(input("Ingrese una opción:"))
                if (opcion == 3):
                    cargarpedido(ID,"P")
                    print("\t ---------------------------Bienvenido Panadero---------------------------------------")
                    cargarmenupanadero()
                    opcion = int(input("Ingrese una opción:"))

            r+2
    if(r==2):
        r=0
    if(r==0):
       r=2
    print(r)
    return r
def cargaropcione(nunopcion):
    print(nunopcion)
    Verificacion()
    opcion = int(input("Ingrese una opción:"))
    while opcion != 3:
        if (opcion == 1):
            r = 1
            while r != 0:
                r = int(Login())
                if r == 2:
                    print("Contraseña Incorrecta")
                    r = int(Login())

        if (opcion == 2):
                print(nunopcion)
                if(nunopcion==1):
                 crearcuenta("Pastelero")
                 Verificacion()
                 opcion = int(input("Ingrese una opción:"))
                else:
                    crearcuenta("Cliente")
                    Verificacion()
                    opcion = int(input("Ingrese una opción:"))

Elegirrol()
opcion = int(input("Ingrese una opción:"))
while opcion !=3 :
    if(opcion==1):
        cargaropcione(opcion)
        Elegirrol()
        opcion = int(input("Ingrese una opción:"))
    else:
         cargaropcione(opcion)
         Elegirrol()
         opcion = int(input("Ingrese una opción:"))