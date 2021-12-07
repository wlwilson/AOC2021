#!/usr/bin/ruby

fname = 'input'

uc=dc=0
prev="none"

File.foreach (fname) { |line| 
  line=line.to_i
  if prev == "none"
    puts "first!"
  elsif line > prev
    puts "increase from #{prev} to #{line}"
    uc+=1
  elsif line < prev
    puts "decrease from #{prev} to #{line}"
    dc+=1
  else
    puts "I don't know what to do with this"
  end
  prev=line
  #puts prev
}
puts "up #{uc} down #{dc}"


