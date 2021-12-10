#!/usr/bin/ruby

fname = 'input1'
fname = 'input'

dataSet=File.readlines(fname)
#puts dataSet.inspect 

def brktsMatch(st1,st2)
  if (st1=="{" && st2=="}") || (st1=="<" && st2==">") || (st1=="(" && st2==")") || (st1=="[" && st2=="]") 
    return true
  else
    return false
  end
end

def charScore (char)
  scores ={")"=>3,"]"=>57,"}"=>1197,">"=>25137}
  return scores[char]
end
def clscr (char)
  #scores ={")"=>1,"]"=>2,"}"=>3,">"=>4}
  scores ={"("=>1,"["=>2,"{"=>3,"<"=>4}
  return scores[char]
end

illegal=Array.new()
cmpScrs=Array.new()
dataSet.each do |line|
  lineArr=line.chomp.split("")
  brkts=Array.new()
  lineIsCorrupt=false
  lineArr.each do |char|
    if !lineIsCorrupt
      if char=="("||char=="["||char=="{"||char=="<"
        brkts.push(char)#puts char
      elsif char==")"||char=="]"||char=="}"||char==">"
        if brktsMatch(brkts.last, char)
          brkts.pop 
        else
          #puts "line #{line} is corrupt"
          lineIsCorrupt=true
          illegal.push(char)
        end
      end
    end
  end
  compScore=0
  if !lineIsCorrupt
    brkts.reverse.each do |str|
      compScore=(compScore*5)+clscr(str)
    end
    cmpScrs.push(compScore)
  end
end 
#puts illegal.inspect

score=0
illegal.each do |str|
  score+=charScore(str)
end
puts "score #{score}"
puts cmpScrs.sort.inspect
puts cmpScrs.sort[(cmpScrs.length-1)/2]