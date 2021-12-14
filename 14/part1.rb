#!/usr/bin/ruby

fname = 'input1'
fname = 'input'
fname = 'inputc'

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

puts template.inspect
for count in 0..29
  i=0
  while i<template.length-1
    thisBit=template[i]+template[i+1]
    #puts rules[template[i]+template[i+1]]
    if rules.keys.include? thisBit
      template.insert(i+1,rules[template[i]+template[i+1]])
      i+=1
    end
    i+=1
  end
end

counts=Hash[]
template.each do |e|
  if counts.keys.include? e
    counts[e]=counts[e]+1
  else
    counts[e]=1
  end
end
puts template.join.inspect
puts counts.values.sort.reverse[0] - counts.values.sort[0]
puts counts.values.sort.reverse.inspect
