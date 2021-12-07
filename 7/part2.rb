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
    fuelCost=0
    delta=(pos-i).abs()
    for j in 1..delta
      fuelCost=fuelCost+j
    end
    fuel=fuel+fuelCost
    #puts "moved from #{pos} to #{i}, fuel cost is #{fuelCost}, totalFuel is #{fuel}"
  end
  if fuel<minFuel
    minFuel=fuel
  end
end

puts minFuel
