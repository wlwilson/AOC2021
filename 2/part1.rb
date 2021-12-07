#!/usr/bin/ruby

fname = 'input'

hp=vp=0

File.foreach (fname) { |line| 
  case line
  when /forward\s+([0-9]+)/
    hp = hp + $1.to_i
  when /up\s+([0-9]+)/
    vp = vp - $1.to_i
  when /down\s+([0-9]+)/
    vp = vp + $1.to_i
  end
}
mult=hp*vp
puts "hp #{hp} vp #{vp} mult #{mult}"


