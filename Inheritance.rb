class Parent 
    def initialize
        puts "parent class"     
    end

end




class Child < Parent
  def initialize
    super
    puts "child class"
  end
end

child1 = Child.new