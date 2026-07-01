class Palindrome
    def find
        name = "madammamaaaa"
        if name.eql? name.reverse
            puts "The string is a palindrome."
        else
            puts "The string is not a palindrome."
        end
    end 
    def m1
        name = "Ajay devgan"
        puts name
       arr1= name.split(" ")
       puts arr1[0]
    end 
    object = Palindrome.new
    object.m1
end 