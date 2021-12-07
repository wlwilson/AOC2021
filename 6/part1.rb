#!/usr/bin/ruby

class Fish
  def initialize(data)
    @fish=data
  end
  def simulate(days)
    for i in 0..days-1
      for j in 0..@fish.length-1
        if @fish[j].to_i==0
          @fish[j]=6;@fish.push(8)
        else
          @fish[j]=@fish[j].to_i-1
        end
      end
    end
    return @fish
  end
end


fname = 'input1'
fname = 'input'

dataSet=File.readlines(fname)

fish=dataSet[0].chomp().split(/,/)
#puts fish
myFish=Fish.new(fish)
#puts myFish.inspect
numDays=18
numDays=256
numDays=80
numDays=100
numDays=120
finalFish=myFish.simulate(numDays)
puts "day #{numDays}"
#puts finalFish.inspect
puts finalFish.length

