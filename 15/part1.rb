#!/usr/bin/ruby

fname = 'input'
fname = 'inputc'
fname = 'input1'

dataSet=File.readlines(fname)
puts dataSet.length
cavern=Array.new(dataSet.length) {Array.new(dataSet[0].length-1)}
dataSet.each_with_index do |line,i|
  arr=line.chomp.split("")
  arr.each_with_index do |c,j|
    cavern[i][j]=c.to_i
  end
end

cavern.each do |l|
  puts l.inspect
end

#class Node
#    def initialize
#    end
#end 

def h(node,cavern)
  x,y=node 
  return (cavern.length-x)+(cavern[0].length-y)
end
def d(node,cavern)
  return cavern[node[0]][node[1]]
end

puts "start (0,0) = #{cavern[0][0]} end (#{cavern.length-1},#{cavern[0].length-1}) = #{cavern[cavern.length-1][cavern[0].length-1]}"

def neighbors(node,cavern)
    x,y=node
    if x==0 && y==0
        return [[x+1,y],[x,y+1]]
    elsif x==cavern.length-1 && y==cavern[0].length-1
        return [[x-1,y],[x,y-1]]
    elsif x==0 && y==cavern[0].length-1
        return [[x+1,y],[x,y-1]]
    elsif x==cavern.length-1 && y==0
        return [[x-1,y],[x,y+1]]
    elsif x==0
        return [[x+1,y],[x,y+1],[x,y+1]]
    elsif y==0
        return [[x+1,y],[x-1,y],[x,y+1]]
    elsif x==cavern.length-1
        return [[x-1,y],[x,y+1],[x,y-1]]
    elsif y==cavern[0].length-1
        return [[x+1,y],[x-1,y],[x,y-1]]
    else
        return [[x+1,y],[x-1,y],[x,y-1],[x,y+1]]
    end
end
    
def aStar(start,goal,cavern)
    openSet=Array.new()
    openSet.push(start)
    cameFrom=Hash[]
    gScore=Hash[]
    gScore[start]=0
    #fscore=100000000
    fScore=Hash[]
    fScore[start]=h(start,cavern)
    while openSet.length > 0
        puts "openSet: #{openSet.inspect}"
        openSet.each do |o|
            if !fScore.keys.include? o
                fScore[o]=gScore[o]+h(o,cavern)
            end
        end
        puts "fScore: #{fScore.inspect}"

        current = fScore.sort_by {|k,v| v}.first[0]
        puts "current #{current.inspect}"
        if current == goal
            return reconstructPath(cameFrom,current)
        end

        openSet.delete(current)
        fScore.delete(current)
        neighbors(current,cavern).each do |n|
            if !gScore.keys.include? n
                gScore[n]=cavern[n[0]][n[1]]
            end
            t_gS=gScore[current]+d(n,cavern)
            puts "  fscore: #{fScore.inspect}"
            puts "  gscore: #{gScore.inspect}"
            puts "  cameFrom: #{cameFrom.inspect}"
            puts "t_gS=#{t_gS} gscore[n]=#{gScore[n]}"
            if t_gS <= gScore[n]
                cameFrom[n]=current
                gScore[n]=t_gS
                #hScore[n]=t_gS + h(neighbor)
                if !openSet.include? n
                    openSet.push(n)
                end
            end
        end
    end
    puts "openSet is empty"
end
puts neighbors([8,8],cavern).inspect

aStar([0,0],[cavern.length-1,cavern[0].length-1],cavern)