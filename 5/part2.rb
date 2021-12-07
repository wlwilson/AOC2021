#!/usr/bin/ruby

class Vent
  def initialize(x1,y1,x2,y2)
    @x1=x1.to_i#(x1.to_i<x2.to_i ? x1.to_i : x2.to_i)
    @y1=y1.to_i#(y1.to_i<y2.to_i ? y1.to_i : y2.to_i)
    @x2=x2.to_i#(x1.to_i>x2.to_i ? x1.to_i : x2.to_i)
    @y2=y2.to_i#(y1.to_i>y2.to_i ? y1.to_i : y2.to_i)
  end
  def x1()
    return @x1
  end
  def x2()
    return @x2
  end
  def y1()
    return @y1
  end
  def y2()
    return @y2
  end
  def start()
    return [@x1,@y1]
  end
  def end()
    return [@x2,@y2]
  end
  def pts()
    return[@x1,@y1,@x2,@y2]
  end
  def to_s()
    return "#{@x1} #{@y1} #{@x2} #{@y2}"
  end
end

class Map
  def initialize(size)
    @counts=Array.new(size) { Array.new(size) {0} }
  end
  def counts()
    return @counts
  end
  def print()
    puts @counts.transpose().map { |x| x.join(' ')}
  end
  def addLine (x1,y1,x2,y2)
    if x1==x2 #vertical
      puts "vertical line from #{x1},#{y1} to #{x2},#{y2}"
      #for i in y1..y2
      for i in (y1<y2 ? y1 : y2)..(y1>y2 ? y1 : y2)
        #puts "V:(#{x1},#{i})"
        @counts[x1][i]=@counts[x1][i].to_i+1
      end
    elsif y1==y2
      puts "horizontal line from #{x1},#{y1} to #{x2},#{y2}"
      #for i in x1..x2
      for i in (x1<x2 ? x1 : x2)..(x1>x2 ? x1 : x2)
        #puts "H:(#{i},#{y1})"
        @counts[i][y1]=@counts[i][y1].to_i+1
      end
    else
      puts "line #{x1} #{y1} -> #{x2} #{y2} is neither horizontal or vertical"
      if (x1-x2).abs()==(y1-y2).abs()
        if x1<x2
          if y1<y2
            ix=x1;iy=y1
            while ix<=x2 && iy<=y2
              #puts "1:(#{ix},#{iy})"
              @counts[ix][iy]=@counts[ix][iy].to_i+1;ix+=1;iy+=1
            end
          elsif y1>y2
            ix=x1;iy=y1
            while ix<=x2 && iy>=y2
              #puts "2:(#{ix},#{iy})"
              @counts[ix][iy]=@counts[ix][iy].to_i+1;ix+=1;iy-=1
            end
          end
        elsif x1>x2
          if y1<y2
            ix=x1;iy=y1
            while ix>=x2 && iy<=y2
              #puts "3:(#{ix},#{iy})"
              @counts[ix][iy]=@counts[ix][iy].to_i+1;ix-=1;iy+=1
            end
          elsif y1>y2
            ix=x2;iy=y2
            while ix<=x1 && iy<=y1
              #puts "4:(#{ix},#{iy})"
              @counts[ix][iy]=@counts[ix][iy].to_i+1;ix+=1;iy+=1
            end
          end
        end
      else
        #puts "line #{x1} #{y1} -> #{x2} #{y2} is not a valid diagonal"
      end
    end
  end
  def countAtLeast(val)
    count=0
    @counts.each do |arr|
      arr.each do |num|
        if num.to_i >= val
          count=count+1
        end
      end
    end
    return count
  end
end

max=0
vents=[]
fname = 'input1'
fname = 'input'
dataSet=File.readlines(fname)
dataSet.each do |line|
  arr=line.split(/,| -> |\r?\n/)
  arr.each do |number|
    if number.to_i > max
      max = number.to_i
    end
  end
  vents.push(Vent.new(arr[0],arr[1],arr[2],arr[3]))
end 
#puts "max #{max}"
#puts vents.inspect


myMap = Map.new(max+1)
vents.each do |vent|
  myMap.addLine(vent.x1(),vent.y1(),vent.x2(),vent.y2())
end
#puts myMap.counts().inspect()
#myMap.print()
overlaps=myMap.countAtLeast(2)
puts overlaps
