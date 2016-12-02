@x=1;@y=1;
@n=[[1,2,3],[4,5,6],[7,8,9]]
def d;@n[@y][@x];end
File.open("kev.txt").each_line do|l| 
  l.split('').each do |c|
    if c=="\n";print d;next;end
    (dx,dy)={U:[0,-1],D:[0,1],L:[-1,0],R:[1,0]}[c.to_sym]
    next if @x==0&&dx==-1||@x==2&&dx==1||@y==0&&dy==-1||@y==2&&dy==1
    @x+=dx;@y+=dy
  end
end
