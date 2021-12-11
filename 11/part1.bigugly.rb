#!/usr/bin/ruby

fname = 'input'
fname = 'input1'
fname = 'inputs'

def octoStep(arr)
  #puts arr.inspect
  for i in 0..arr.length-1 do
    for j in 0..arr[0].length-1 do
      arr[i][j]=arr[i][j]+1
    end
  end
  arr.each do |line|
    puts line.inspect
  end
  puts""
  nflash=Array.new(arr.length) {Array.new(arr[0].length) {1} }
  flash=Array.new(arr.length) {Array.new(arr[0].length) {0} }
 
  while arr.flatten.max > 8
    puts "Here!"
    for i in 0..arr.length-1 do
      for j in 0..arr[0].length-1 do
        if arr[i][j]>=9
          nflash[i][j]=0; flash[i][j]=1
          arr[i][j]=0
          #increment neighbors
          if i==0 
            if j==0
              arr[i][j+1]=(arr[i][j+1]+1*nflash[i][j+1])
              arr[i+1][j]=(arr[i+1][j]+1*nflash[i+1][j])
              arr[i+1][j+1]=(arr[i+1][j+1]+1*nflash[i+1][j])
            elsif j==arr[0].length
              arr[i][j-1]=(arr[i][j-1]+1*nflash[i][j-1])
              arr[i+1][j]=(arr[i+1][j]+1*nflash[i+1][j])
              arr[i+1][j-1]=(arr[i+1][j-1]+1*nflash[i+1][j-1])
              arr[i+1][j]=(arr[i+1][j]+1*nflash[i+1][j])
              arr[i-1][j]=(arr[i-1][j]+1*nflash[i-1][j])
              arr[i-1][j-1]=(arr[i-1][j-1]+1*nflash[i-1][j-1])
            else
              for l in i..i+1
                for m in j-1..j+1
                  unless l==m
                    arr[l][m]=(arr[l][m]+1*nflash[l][m])
                    puts "Here #{l} #{m}"
                  end
                end
              end
              #arr[i][j+1]=(arr[i][j+1]+1*nflash[i][j+1])
              #arr[i][j+1]+=1
              #arr[i][j-1]+=1
              #arr[i+1][j]+=1
              #arr[i+1][j+1]+=1
              #arr[i+1][j-1]+=1
            end
          elsif i==arr.length
            if j==0
              arr[i][j+1]+=1
              arr[i-1][j]+=1
              arr[i-1][j+1]+=1
            elsif j==arr[0].length 
              arr[i][j-1]+=1
              arr[i-1][j]+=1
              arr[i-1][j-1]+=1
            else
              arr[i][j+1]+=1
              arr[i][j-1]+=1
              arr[i+1][j-1]+=1
              arr[i-1][j]+=1
              arr[i-1][j+1]+=1
              arr[i-1][j-1]+=1
            end
          else
              for l in i-1..i+1
                for m in j-1..j+1
                  unless l==m
                    arr[l][m]=(arr[l][m]+1*nflash[l][m])
                    puts "Here #{l} #{m}"
                  end
                end
              end
#            arr[i][j+1]+=1
#            arr[i][j-1]+=1
#            arr[i+1][j]+=1
#            arr[i+1][j+1]+=1
#            arr[i+1][j-1]+=1
#            arr[i-1][j]+=1
#            arr[i-1][j+1]+=1
#            arr[i-1][j-1]+=1
          end
          #arr.each do |line|
          #  puts line.inspect
          #end
          #puts ""
          #arr[i][j]+=1
        end
      end
    end
    arr.each do |line|
      puts line.inspect
    end
    flash.each do |line|
      puts line.inspect
    end
  end
end

#def incrNeighbors(arr,x,y)
#  if arr[i][j]==9
#        #puts "flash"
#  end
#end


dataSet=File.readlines(fname)
octo=Array.new()
dataSet.each do |line|
  octo.push((line.to_s.scan /\w/).map(&:to_i))
end

octoStep(octo)
