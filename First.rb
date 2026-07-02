
module FirstModule
    def greet
        puts "Greetings from FirstModule!"
    end
end

class First
    VERSION = "1.0.0"
    puts "Hello, World!"

    include FirstModule
end

