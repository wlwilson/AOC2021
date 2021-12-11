#!/usr/bin/ruby

fname = 'inputs'
fname = 'input1'
fname = 'input'

def octoStep(arr,numSteps)
  flashes=0
  currentStep=0
  while currentStep < numSteps
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
 
    while arr.flatten.max > 9
      for i in 0..arr.length-1 do
        for j in 0..arr[0].length-1 do
          if arr[i][j]>9
            nflash[i][j]=0; flash[i][j]=1
            arr[i][j]=0
            #increment neighbors
            if i==0 
              ilow=i;ihi=i+1
            elsif i==arr.length-1
              ilow=i-1;ihi=i
            else
              ilow=i-1;ihi=i+1
            end
            if j==0
              jlow=j;jhi=j+1
            elsif j==arr[0].length-1
              jlow=j-1;jhi=j
            else
              jlow=j-1;jhi=j+1
            end
            for l in ilow..ihi
              for m in jlow..jhi
                  #puts "Here #{l} #{m}"
                  #puts arr.inspect
                  #puts nflash.inspect
                  #puts "i:#{i} j:#{j} l:#{l} m:#{m} il:#{ilow} ih:#{ihi} jl:#{jlow} jh:#{jhi}"
                  arr[l][m]=(arr[l][m]+1*nflash[l][m])
              end
            end
          end
        end
      end
    end
    flashes+=flash.flatten.sum
    currentStep+=1
  end
  puts "total flashes #{flashes}"
  return arr
end

dataSet=File.readlines(fname)
octo=Array.new()
dataSet.each do |line|
  octo.push((line.to_s.scan /\w/).map(&:to_i))
end

step = octoStep(octo,100)

step.each do |line|
  puts line.inspect
end