#!/usr/bin/ruby

fname = 'input'

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

def o2gen (arr, pos)
  outlist=[]
  if arr.length==1
    puts "only one element left in array #{arr[0]}"
    outlist=arr
  elsif pos > arr[0].length-1
    puts "index out of bounds!!!"
  else
    commonVal=getMostCommonBitInPos(arr,pos)
    if commonVal==nil
      puts "same number of 1s and 0s in column #{pos+1}"
      filteredList=filterVals(arr,pos,1)
      puts "-------"
      puts filteredList
      puts "-------"
      outlist=o2gen(filteredList,pos+1)
    else
      puts "More #{commonVal}s in column #{pos}"
      filteredList=filterVals(arr,pos,commonVal)
      puts "-------"
      puts filteredList
      puts "-------"
      outlist=o2gen(filteredList,pos+1)
    end
  end
  return outlist
end

def co2gen (arr, pos)
  outlist=[]
  if arr.length==1
    puts "only one element left in array #{arr[0]}"
    outlist=arr
  elsif pos > arr[0].length-1
    puts "index out of bounds!!!"
  else
    commonVal=getMostCommonBitInPos(arr,pos)
    if commonVal==nil
      puts "same number of 1s and 0s in column #{pos+1}"
      filteredList=filterVals(arr,pos,0)
      puts "-------"
      puts filteredList
      puts "-------"
      outlist=co2gen(filteredList,pos+1)
    else
      puts "More #{commonVal}s in column #{pos+1}"
      commonVal=(commonVal+1)%2
      puts "Keeping values with a #{commonVal} in pos #{pos+1}"
      filteredList=filterVals(arr,pos,commonVal)
      puts "-------"
      puts filteredList
      puts "-------"
      outlist=co2gen(filteredList,pos+1)
    end
  end
  return outlist
end


def getMostCommonBitInPos(arr,pos)
  zc=oc=0
  arr.each do |line|
    bits=line.scan /\w/
    if bits[pos].to_i==0
      zc=zc+1
    else
      oc=oc+1
    end
  end
  outval=nil
  if zc>oc
    outval=0
  elsif oc>zc
    outval=1
  end
  return outval
end

def binStringToDec(str)
  val=0
  bits=str.scan /\w/
  for i in 0..str.length-1 do
    val=val+(bits[i].to_i*(2**((str.length-1)-i)))
  end
  return val
end

dataSet=File.readlines(fname)
puts dataSet

o2Val=o2gen(dataSet,0)[0].chomp
puts "o2val is #{o2Val}"

co2Val=co2gen(dataSet,0)[0].chomp
puts "co2val is #{co2Val}"

o2dec=binStringToDec(o2Val)
co2dec=binStringToDec(co2Val)

mult = o2dec*co2dec
puts "o2 #{o2dec} co2 #{co2dec} mult #{mult}"
