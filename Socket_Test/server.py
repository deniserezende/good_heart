import socket

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM) # Cria um socket TCP/IP

server.bind(('localhost',3333)) # Seta o ip e a porta do servidor

server.listen(1) # Configura servidor para escutar 1 cliente

while True:
    print('Esperando pela conexao...')
    connection, client_address = server.accept() # Servidor fica esperando para aceitar um cliente

    try:
        print('Cliente conectado: ', client_address)
        while True:
            data = connection.recv(100)
            print(f"Recebido: %s"%data.decode())
            if data:
                print("Enviando conteudo de volta para o cliente...")
                connection.sendall(data)
    finally:
        connection.close()


