#!/usr/bin/ruby

class Fish
  def initialize(data)
    @fish=Array.new(9) {0}
    for i in 0..8
      @fish[i]=0
    end
    data.each do |age|
      @fish[age.to_i]=@fish[age.to_i].to_i+1
    end
  end
  def simulate(days)
    for i in 0..days-1
      births=@fish.shift()
      @fish[6]=@fish[6].to_i+births
      @fish[8]=@fish[8].to_i+births
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
puts myFish.inspect
numDays=80
numDays=256
finalFish=myFish.simulate(numDays)
puts "day #{numDays}"
puts finalFish.inspect
puts finalFish.sum
