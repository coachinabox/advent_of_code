@d=@x=@y=0;@p=[];@s=nil
def move(l,d)
  @d+=(l=='L'? -1:1);@d=3 if @d==-1;@d=0 if @d==4
  1.upto(d) do
    (x,y)=[[0,1],[1,0],[0,-1],[-1,0]][@d]
    @x+=x;@y+=y;
    puts "Part 2: #{@s=t}" if (!@s&&@p.include?([@x,@y]))
    @p << [@x,@y]
end end
def t;@x.abs+@y.abs end
IO.read('kev.txt').split(", ").each{|i|move(i[0],i[1..-1].to_i)}
puts "Part 1: #{t}"
