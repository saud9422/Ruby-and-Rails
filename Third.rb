class Third

    person = {}

   person[:name] = "John Doe"
   person[:age] = 30
   person[:city] = "New York"

    def display_person_info(person)
        puts person[:name]
        puts person[:age]
        puts person[:city] 
    end 

    Third.new.display_person_info(person)

end
