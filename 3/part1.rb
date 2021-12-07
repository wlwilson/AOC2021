#!/usr/bin/ruby

fname = 'input'

sum=[]
length=0
File.foreach (fname) { |line| 
  current=line.scan /\w/
  if sum.length == 0 
    sum = current
  else
    for i in 0..sum.length-1 do 
      sum[i]=sum[i].to_i+current[i].to_i
    end
  end
  length = length + 1
#puts sum
#puts "------"
}
#puts length
#puts "hp #{hp} vp #{vp} mult #{mult}"
g=e=0
gam=[]
eps=[]
for i in 0..sum.length-1 do
  if sum.reverse[i] > length/2 
    gam[i]=1
    eps[i]=0
    g=g+(2**i)
    puts "i #{i} g #{g}"
  else
    gam[i]=0
    eps[i]=1
    e=e+(2**i)
  end
end
puts gam
puts "----"
puts eps
puts "g #{g} e #{e}" 
mult = g*e
puts mult

