#!/usr/bin/ruby

fname = 'input1'
fname = 'input'

dataSet=File.readlines(fname)

crabs=dataSet[0].chomp().split(/,/).map(&:to_i)
puts crabs.inspect

minFuel=100000000000
for i in crabs.min()..crabs.max() 
  fuel=0
  crabs.each do |pos|
    fuel = fuel + (pos - i).abs()
  end
  if fuel<minFuel
    minFuel=fuel
  end
end

puts minFuel
