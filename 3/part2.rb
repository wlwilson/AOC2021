#!/usr/bin/ruby

fname = 'input1'

def filterVals (arr, index, val)
  outList=[]
  arr.each do |line| 
    bits=line.scan /\w/
    if bits[index].to_i==val
      outList.push(line)
    end
  end
  return outList
end

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
}
g=e=0
gam=[]
eps=[]
for i in 0..sum.length-1 do
  #if sum.reverse[i] > length/2 
  if sum[i] > length/2 
    gam[i]=1
    eps[i]=0
    g=g+(2**((sum.length-1)-i))
    puts "i #{i} g #{g}"
  else
    gam[i]=0
    eps[i]=1
    e=e+(2**((sum.length-1)-i))
  end
end
puts gam.join
puts "----"
puts eps.join
puts "g #{g} e #{e}" 
mult = g*e
puts mult

