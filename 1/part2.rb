#!/usr/bin/ruby

fname = 'input'

uc=dc=0
window=Array.new(3,"none")
prevSum="none"

File.foreach (fname) { |line| 
  line=line.to_i
  window.push(line)
  window.shift
  #puts "prevSum #{prevSum}"
  if prevSum == "none"
    puts "first two!"
  elsif window.sum > prevSum
    uc+=1
  elsif window.sum < prevSum
    dc+=1
  else
    puts "No change: #{prevSum} vs #{window.sum}"
    puts "window"
    puts window
  end
  if !window.include? 'none'
    prevSum=window.sum
  end
}
puts "up #{uc} down #{dc}"

