#!/usr/bin/ruby

fname = 'inputc'
fname = 'input1'
fname = 'input'

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

iter=39
for count in 0..iter
  currentPairs=pairs.clone()
  pairs.keys.each do |p|
    if rules.keys.include? p
      if counts.keys.include? rules[p]
        counts[rules[p]]=counts[rules[p]]+currentPairs[p]
      else
        counts[rules[p]]=1
      end
      sp=p.split("")
      newPairs=[sp[0]+rules[p],rules[p]+sp[1]]
      newPairs.each do |np|
        if pairs.keys.include? np
          pairs[np]=pairs[np]+currentPairs[p]
        else
          pairs[np]=currentPairs[p]
        end
      end
      if pairs[p]>currentPairs[p]
        pairs[p]=pairs[p]-currentPairs[p]
      else
        pairs.delete(p)
      end
    end
  end
  #puts pairs.inspect
  #puts counts.inspect
end

puts "length #{counts.values.sum}"
puts "Answer:"
puts counts.values.sort.reverse[0] - counts.values.sort[0]
