#!/usr/bin/ruby

counts=Hash[]
#t="NBCCNBBBCBHCB"
#t="NBBBCNCCNBBNBNBBCHBHHBCHB"
t="NBBNBNBBCCNBCNCCNBBNBBNBBBNBBNBBCBHCBHHNHCBBCBHCB"
t.split("").each do |e|
  if counts.keys.include? e
    counts[e]=counts[e]+1
  else
    counts[e]=1
  end
end
puts counts.inspect
puts t.split("").length

template=t.split("")
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

