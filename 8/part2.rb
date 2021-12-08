#!/usr/bin/ruby

require "set"

fname = 'input'
fname = 'input1'

dataSet=File.readlines(fname)
#puts dataSet.join.split(/\||\r?\n/).inspect
#outStrings = dataSet.join.split(/^.+\| /).join.split(/\r?\n/).join(" ").split(" ")
outStrings = dataSet.join.split(/^.+\| /).join.split(/\r?\n/)
dataStrings =  dataSet.join.split(/ \|.+$/).join.split(/\r?\n/)


stringMap=Hash[]
for i in 0..dataStrings.length 
  dataStrings[i].to_s.split() do |subst|
    if subst.length == 2
      stringMap[1]=subst
    elsif subst.length == 4
      stringMap[4]=subst
    elsif subst.length == 3
      stringMap[7]=subst
    elsif subst.length == 7
      stringMap[8]=subst
    end
  end
  dataStrings[i].to_s.split() do |subst|
    #Length = 5, 2,3,5
    if subst.length == 5
      #1 is subset ->3
      if (stringMap[1].scan /\w/).to_set.subset?((subst.scan /\w/).to_set)
        stringMap[3]=subst
      #(4set - 1set) is subset, then 5
      elsif ((stringMap[4].scan /\w/)-(stringMap[1].scan /\w/)).to_set.subset?((subst.scan /\w/).to_set)
        stringMap[5]=subst
      #else 2
      else
        stringMap[2]=subst
      end
    end
    #Length = 6, => 0,6,or 9
    if subst.length == 6
      #and 4 is subset -> 9
      if (stringMap[4].scan /\w/).to_set.subset?((subst.scan /\w/).to_set)
        stringMap[9]=subst
      #if 1 is subset, then 0
      elsif (stringMap[1].scan /\w/).to_set.subset?((subst.scan /\w/).to_set)
        stringMap[0]=subst
      #else 6
      else
        stringMap[6]=subst
      end
    end
  end
  puts stringMap.inspect
  outStrings[i].to_s.split().each do |numString|
    puts stringMap.keys.inspect
    #for stringMap.keys do |ke|
    #  #if (numString.scan /\w/).to_set==(stringMap[ke].scan /\w/).to_set
    #  # puts ke
    #  # end
    #end
  end
end
  
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
#count=0
#outStrings.each do |string|
#  if string.length==2||string.length==4||string.length==3||string.length==7 #1,4,7,8
#  puts string.length
#    count+=1
#  end
#end
#puts count