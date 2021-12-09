#!/usr/bin/ruby

require "set"

fname = 'input1'
fname = 'input'

dataSet=File.readlines(fname)
outStrings = dataSet.join.split(/^.+\| /).join.split(/\r?\n/)
dataStrings =  dataSet.join.split(/ \|.+$/).join.split(/\r?\n/)
finalNumbers=Array.new()

stringMap=Hash[]
for i in 0..dataStrings.length-1 
  dataStrings[i].to_s.split().each do |subst|
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
  dataStrings[i].to_s.split().each do |subst|
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
  stringMap.each do |k,v|
    stringMap[k]=(v.to_s.scan /\w/).to_set
    #puts "#{k} --> #{v}"
  end

  numString=""
  outStrings[i].split().each do |subs|
    arr=(subs.scan /\w/).to_set
      stringMap.each do |k,v|
      if v==arr
        numString+=k.to_s
     end
    end
  end
  finalNumbers.push(numString.to_i)
end
puts finalNumbers.sum

#abcefg  = 0
#cf      = 1
#acdeg   = 2
#acdfg   = 3
#bcdf    = 4
#abdfg   = 5
#abdefg  = 6
#acf     = 7
#abcdefg = 8