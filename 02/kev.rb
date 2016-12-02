def d(x=@x,y=@y);@n[y] && @n[y][x];end
def run
  o=''
  File.open("kev.txt").each_line do|l|
    l.split('').each do |c|
      if c=="\n";o<<d.to_s;next;end
      (dx,dy)={U:[0,-1],D:[0,1],L:[-1,0],R:[1,0]}[c.to_sym]
      next if d(@x+dx,@y+dy).nil?;@x+=dx;@y+=dy
  end;end;o
end

@x=2;@y=2;
@n=[[nil,nil,nil],[1,2,3,nil],[4,5,6,nil],[7,8,9,nil]]
puts "Part 1: #{run}"
@n=[[nil,nil,nil],[nil,nil,1,nil],
    [nil,2,3,4,nil],[5,6,7,8,9,nil],
    [nil,'A','B','C',nil],[nil,nil,'D',nil],
    [nil,nil,nil]]
@x=2;@y=3;
puts "Part 2: #{run}"
