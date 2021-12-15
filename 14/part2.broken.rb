#!/usr/bin/ruby

fname = 'inputc'
fname = 'input'
fname = 'input1'

dataSet=File.readlines(fname)
#puts dataSet.inspect 
template=dataSet[0].chomp.split("")
rules=Hash[]
dataSet.each do |line|
  if line=~/([A-Z][A-Z]) -> ([A-Z])/
    rules[$1]=$2
  end
end
puts rules.inspect

pairs=Hash[]
for i in 0..template.length-2
  thisBit=template[i]+template[i+1]
  if pairs.keys.include? thisBit
    pairs[thisBit]+=1
  else
    pairs[thisBit]=1
  end
end
puts pairs.inspect
  
counts=Hash[]
template.each do |e|
  if counts.keys.include? e
    counts[e]=counts[e]+1
  else
    counts[e]=1
  end
end
puts counts.inspect
puts ""

iter=29
for count in 0..iter
  pairsPlus=Hash[]
  pairs.keys.each do |p|
    #puts "checking pair #{p}"
    #add singles to the counts
    if rules.keys.include? p
      #Can't decide what to do with deletions....
      #pairs[p]=pairs[p]-1 if pairs[p]!=0
      #if pairs[p]==0
      #  puts "  !deleting pair #{p}"
      #  pairs.delete(p)
      #end
      if counts.keys.include? rules[p]
        #puts "  incrementing counts[#{rules[p]}] by #{pairs[p]}"
        #puts "  ---#{pairs[p]} pairs of #{p} already exist"
        #counts[rules[p]]=counts[rules[p]]+1
        #counts[rules[p]]=counts[rules[p]]+(pairs[p])
        newChar=rules[p]
        counts[newChar]=counts[newChar]+(pairs[p])
      else
        #puts "  setting counts[#{rules[p]}]=1"
        counts[rules[p]]=1
      end
      sp=p.split("")
      newPairs=[sp[0]+rules[p],rules[p]+sp[1]]
      #puts "  -->new pairs #{newPairs.inspect}"
      for j in 0..pairs[p]-1
      newPairs.each do |np|
        if pairsPlus.keys.include? np
          pairsPlus[np]=pairsPlus[np]+1
        else
          pairsPlus[np]=1
        end
      end
      end
      #puts pairsPlus.inspect
    else
      #puts "pair #{p} doesn't add elements"
    end
  end
  pairs=pairsPlus.clone
  puts "iter #{count}"
  puts pairs.inspect
  puts counts.inspect
  puts "length #{counts.values.sum}"
end

puts counts.inspect
#exit
#
#counts=Hash[]
#template.each do |e|
#  if counts.keys.include? e
#    counts[e]=counts[e]+1
#  else
#    counts[e]=1
#  end
#end
#puts template.join.inspect
puts counts.values.sort.reverse.inspect
puts "length #{counts.values.sum}"
puts "Answer:"
puts counts.values.sort.reverse[0] - counts.values.sort[0]
