require 'thread'
class Hashes
 ash = { "a": 100, "b":200 }
 puts ash[:a]  
 puts ash.fetch(:b,"not found")

 arr = ash.flatten
 puts arr.inspect

 hash1 = {}
 puts Hash.try_convert({ "a": 100, "b":200 })
 puts Hash.try_convert(arr)
 
end
