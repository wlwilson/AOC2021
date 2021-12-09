#!/usr/bin/ruby

fname = 'input1'
fname = 'input'

def isLowSpot(arr,x,y)
  if x==0 && y==0
    arr[x][y]<arr[x+1][y] && arr[x][y]<arr[x][y+1]
  elsif x==arr.length-1 && y==arr[0].length-1
    arr[x][y]<arr[x-1][y] && arr[x][y]<arr[x][y-1] 
  elsif x==0 && y==arr[0].length-1
    arr[x][y]<arr[x+1][y] && arr[x][y]<arr[x][y-1] 
  elsif x==arr.length-1 && y==0
    arr[x][y]<arr[x-1][y] && arr[x][y]<arr[x][y+1] 
  elsif x==0
    if arr[x][y]<arr[x+1][y] && arr[x][y]<arr[x][y-1] && arr[x][y]<arr[x][y+1]
      #puts "up #{arr[x+1][y]} down #{arr[x][y-1]} left #{arr[x+1][y]}"
      #puts "min #{arr[x][y]}"
      return arr[x][y]<arr[x+1][y] && arr[x][y]<arr[x][y-1] && arr[x][y]<arr[x+1][y]
    end
  elsif y==0
    if arr[x][y]<arr[x-1][y] && arr[x][y]<arr[x+1][y] && arr[x][y]<arr[x][y+1]
      #puts "min #{arr[x][y]}"
      return arr[x][y]<arr[x-1][y] && arr[x][y]<arr[x+1][y] && arr[x][y]<arr[x][y+1]
    end
  elsif x==arr.length-1 
    if arr[x][y]<arr[x-1][y] && arr[x][y]<arr[x][y-1] && arr[x][y]<arr[x][y+1]
      #puts "min #{arr[x][y]}"
      return arr[x][y]<arr[x-1][y] && arr[x][y]<arr[x][y-1] && arr[x][y]<arr[x][y+1]
    end
  elsif y==arr[0].length-1 
    if arr[x][y]<arr[x-1][y] && arr[x][y]<arr[x+1][y] && arr[x][y]<arr[x][y-1]
      #puts "min #{arr[x][y]}"
      return arr[x][y]<arr[x-1][y] && arr[x][y]<arr[x+1][y] && arr[x][y]<arr[x][y-1]
    end
  else
    arr[x][y]<arr[x-1][y] && arr[x][y]<arr[x+1][y] && arr[x][y]<arr[x][y-1] && arr[x][y]<arr[x][y+1]
  end
end
def basinArea(arr,chk,x,y)
  if arr[x][y].to_i==9
    #puts "area is 0"
    return 0
  elsif chk[x][y]==1
    #puts "already been here"
    return 0
  else
    puts "checking new area #{x} #{y}"
    chk[x][y]=1
    if x==0 && y==0
      area=1+basinArea(arr,chk,x+1,y)+basinArea(arr,chk,x,y+1)
      puts "#{x} #{y} #{arr[x][y]}"
    return area
    elsif x==arr.length-1 && y==arr[0].length-1
      area=1+basinArea(arr,chk,x-1,y)+basinArea(arr,chk,x,y-1)
    return area
    elsif x==0 && y==arr[0].length-1
      area=1+basinArea(arr,chk,x+1,y)+basinArea(arr,chk,x,y-1)
    return area
    elsif x==arr.length-1 && y==0
      area=1+basinArea(arr,chk,x-1,y)+basinArea(arr,chk,x,y+1)
    return area
    elsif x==0
      area=1+basinArea(arr,chk,x+1,y)+basinArea(arr,chk,x,y-1)+basinArea(arr,chk,x,y+1)
    return area
    elsif y==0
      area=1+basinArea(arr,chk,x-1,y)+basinArea(arr,chk,x+1,y)+basinArea(arr,chk,x,y+1)
    return area
    elsif x==arr.length-1 
      area=1+basinArea(arr,chk,x-1,y)+basinArea(arr,chk,x,y-1)+basinArea(arr,chk,x,y+1)
    return area
    elsif y==arr[0].length-1 
      area=1+basinArea(arr,chk,x-1,y)+basinArea(arr,chk,x+1,y)+basinArea(arr,chk,x,y-1)
    return area
    else
      area=1+basinArea(arr,chk,x-1,y)+basinArea(arr,chk,x+1,y)+basinArea(arr,chk,x,y-1)+basinArea(arr,chk,x,y+1)
    return area
    end
    puts "did stuff, new area is #{area}"
    return area
  end
end
dataSet=File.readlines(fname)
#puts dataSet.inspect
floor=Array.new()
dataSet.each do |line|
  floor.push(line.to_s.scan /\w/)
end
for i in 0..floor.length-1
  for j in 0..floor[0].length-1
    floor[i][j]=floor[i][j].to_i
  end
end
risk=0
checked = Array.new(floor.length) {Array.new(floor[0].length) {0} }
maxBasin = [0,0,0]
maxBas=0
puts floor.inspect
#puts basinArea(floor,checked,0,0)
for i in 0..floor.length-1
  for j in 0..floor[0].length-1
    #if isLowSpot(floor,i,j)
    #  puts floor[i][j]
    #  risk=risk+floor[i][j]+1
    #end
    newArea=basinArea(floor,checked,i,j)
      maxBasin.push(newArea)
      maxBasin=maxBasin.sort.reverse
      maxBasin.pop
  end
end
puts "------"
puts maxBasin.inspect
puts maxBasin.reject(&:zero?).inject(:*)

#floor=dataSet.join.split(/\||\r?\n/).inspect
