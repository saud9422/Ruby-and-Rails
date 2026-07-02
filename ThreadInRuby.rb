require 'thread'

class demo 
    thread =Thread.new do
        5.times do |i|
            puts "Thread #{i}"
            sleep(1)
        end
    end

    thread.join
end

demo = demo.new
demo.run