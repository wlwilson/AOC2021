#!/usr/bin/ruby

fname = 'input'
fname = 'input1'

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
def basinArea(arr,x,y)
  if arr[x][y].to_i==9
    puts "area is 0"
    return 0
  else
    if x==0 && y==0
      area=basinArea(arr,x+1,y)+basinArea(arr,x,y+1)
      puts "#{x} #{y} #{arr[x][y]}"
    elsif x==arr.length-1 && y==arr[0].length-1
      area=basinArea(arr,x-1,y)+basinArea(arr,x,y-1)
    elsif x==0 && y==arr[0].length-1
      area=basinArea(arr,x+1,y)+basinArea(arr,x,y-1)
    elsif x==arr.length-1 && y==0
      area=basinArea(arr,x-1,y)+basinArea(arr,x,y+1)
    elsif x==0
      area=basinArea(arr,x+1,y)+basinArea(arr,x,y-1)+basinArea(arr,x,y+1)
    elsif y==0
    puts "woohoo! x #{x} y #{y}"
      area=basinArea(arr,x-1,y)+basinArea(arr,x+1,y)+basinArea(arr,x,y+1)
    elsif x==arr.length-1 
      area=basinArea(arr,x-1,y)+basinArea(arr,x,y-1)+basinArea(arr,x,y+1)
    elsif y==arr[0].length-1 
      area=basinArea(arr,x-1,y)+basinArea(arr,x+1,y)+basinArea(arr,x,y-1)
    else
      area=basinArea(arr,x-1,y)+basinArea(arr,x+1,y)+basinArea(arr,x,y-1)+basinArea(arr,x,y+1)
    end
    return area
  end
  return area
  puts area
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
maxBasin = [0,0,0]
for i in 0..floor.length-1
  for j in 0..floor[0].length-1
    #if isLowSpot(floor,i,j)
    #  puts floor[i][j]
    #  risk=risk+floor[i][j]+1
    #end
    puts basinArea(floor,i,j)
    #if basinArea(floor,i,j) > maxBasin[0]
    #  maxBasin.unshift(basinArea)
    #end
  end
end
puts maxBasin.inspect

#floor=dataSet.join.split(/\||\r?\n/).inspect
