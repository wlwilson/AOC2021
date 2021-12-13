#!/usr/bin/ruby

fname = 'input1'
fname = 'input'

dataSet=File.readlines(fname)
#puts dataSet.inspect 
folds=Array.new
dots=Array.new
lim=[0,0]
dataSet.each do |line|
  if line=~/(\d+),(\d+)/
    if $1.to_i>lim[0]
      lim[0]=$1.to_i
    end
    if $2.to_i>lim[1]
      lim[1]=$2.to_i
    end
    dots.push([$1.to_i,$2.to_i])
  elsif line=~/fold along ([x|y])=(\d+)/
    folds.push([$1,$2.to_i])
  end
end
puts "Xlim #{lim[0]} Ylim #{lim[1]}"
#puts dots.inspect
#puts "Total:dots #{dots.length}"
#puts folds.inspect

#folds.each do |f|
f=folds[0]
  puts f.inspect
  if f[0]=="x"
    index=0
  elsif f[0]=="y"
    index=1
  end
  for i in f[1].to_i..lim[index]
    dots.each do |d| 
      if d[index].to_i==i
        #puts "i=#{i} #{d.inspect} limit #{lim[index]} lim-i #{lim[index]-i}"
        puts "i=#{i} #{d.inspect} limit #{lim[index]} lim-i #{lim[index]-i} #{f[1]-(i-f[1])}"
        #d[index]=lim[index]-i
        d[index]=f[1]-(i-f[1])
      end
    end
  end
  dots.each do |d| 
    if d[index].to_i==f[1]
      dots.delete(d)
    end
  end
  lim[index]=f[1]-1
  puts lim.inspect
  dots=dots.uniq
  puts "Total:dots #{dots.uniq.length}"
  #puts dots.inspect
#end
#dots=dots.uniq
#puts "Total:dots #{dots.length}"
