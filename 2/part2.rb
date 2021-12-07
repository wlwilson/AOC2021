#!/usr/bin/ruby

fname = 'input'

hp=vp=aim=0

File.foreach (fname) { |line| 
  case line
  when /forward\s+([0-9]+)/
    hp = hp + $1.to_i
    vp = vp + (aim * $1.to_i)
  when /up\s+([0-9]+)/
    aim = aim - $1.to_i
  when /down\s+([0-9]+)/
    aim = aim + $1.to_i
  end
}
mult=hp*vp
puts "hp #{hp} vp #{vp} mult #{mult}"


