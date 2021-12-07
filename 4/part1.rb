#!/usr/bin/ruby

require 'csv'
require 'matrix'

class BingoCard
  def initialize(data)
    @vals=CSV.parse(data,col_sep: " ",converters: :integer).each.to_a
    @height=@vals.length
    @width=@vals[0].length
    @calls=Array.new(@height) { Array.new(@width) {0} }
    @winner=false
  end
  def addCall(number)
    index=Matrix[*@vals].index(number)
    if index!=nil
      @calls[index[0]][index[1]]=1
    end
    #puts "-------"
    #puts @calls
    #puts "-------"
  end
  def sumUnmarked
    sum=0
    for i in 0..@width-1
      for j in 0..@height-1
        sum=sum+((@calls[i][j]+1)%2)*@vals[i][j]
      end
    end
    return sum
  end
  def isWinner
    if @winner
      return @winner
    else
      for i in 0..@width-1
        if Matrix[*@calls].row(i).to_a.all? { |num| num==1 } || Matrix[*@calls].column(i).to_a.all? { |num| num==1 }
          @winner=true
        end
      end
    end
    return @winner
  end
  def dump
    puts "-------"
    puts "h #{@height}"
    puts "1 #{@width}"
    puts @vals
    puts "-------"
  end
end

fname = 'input'
dataSet=File.readlines(fname)
bingoSet=dataSet.join.split(/\n\n/)
numberCalls=bingoSet.shift
bingoCards=[]
bingoSet.each do |line|
  puts line
  puts " "
  thisCard=BingoCard.new(line)
  bingoCards.push(thisCard)
end

numCards=bingoCards.length
puts "Created #{numCards} bingo cards"

haveWinner=false

callouts=CSV.parse(numberCalls,converters: :integer)[0]
callouts.each do |number|
  puts "Current number #{number}"
  bingoCards.each do |card|
    card.addCall(number)
    haveWinner = card.isWinner
    if haveWinner
      puts "found a winner"
      mySum=card.sumUnmarked()
      mult=mySum*number
      puts "Sum #{mySum} number #{number} - mult #{mult}"
      return
    end
  end
end


#puts callouts
#test=bingoCards[0].sumUnmarked()
#puts test
