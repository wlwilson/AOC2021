#!/usr/bin/ruby

fname = 'input1'
fname = 'input'

dataSet=File.readlines(fname)
#puts dataSet.join.split(/\||\r?\n/).inspect
outStrings = dataSet.join.split(/^.+\| /).join.split(/\r?\n/).join(" ").split(" ")

#abcefg  = 0
#cf      = 1
#acdeg   = 2
#acdfg   = 3
#bcdf    = 4
#abdfg   = 5
#abdefg  = 6
#acf     = 7
#abcdefg = 8
#abcdfg  = 9
count=0
outStrings.each do |string|
  if string.length==2||string.length==4||string.length==3||string.length==7 #1,4,7,8
  puts string.length
    count+=1
  end
end
puts count