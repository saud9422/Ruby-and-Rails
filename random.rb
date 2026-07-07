require 'securerandom'
class Random
    def gen
        upper_bound = 10**6

        n=SecureRandom.random_number(upper_bound)
        puts "random number #{n}"
    end

end
 r=Random.new
 r.gen