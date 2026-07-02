
class demo
    require 'socket'
    server=TCPserver.open(2017)
puts "this is server socket"
    client=server.accept
    client.puts "Hello from server"
    client.close
end 


class SocketClient
   hostname = 'localhost'   
port = 2017   
  
s = TCPSocket.open(hostname, port)   
  
while line = s.gets   
    puts line.chomp   
end   
s.close   
end
