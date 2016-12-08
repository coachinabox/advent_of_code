class Screen
  def initialize
    @screen = Array.new(6).map{ String.new(" " * 50) }
  end

  def rect!(x,y)
    0.upto(y-1){|y| @screen[y][0,x] = "*" * x }
  end

  def rotY!(y,n)
    @screen[y] = @screen[y].split("").rotate(-n).join
  end

  def rotX!(x,n)
    tr = @screen.map{|x| x.split("")}.transpose
    tr[x] = tr[x].rotate(-n)
    @screen = tr.transpose.map{|x| x.join}
  end

  def to_s
    @screen
  end

  def lit
    @screen.reduce(0){|sum,s| sum + s.count("*")}
  end
end

screen = Screen.new
File.open("kev.txt").each_line do |line|
  line = line.split
  screen.rect!(*line[1].split("x").map(&:to_i)) if line[0] == "rect"
  screen.rotY!(line[2][2..-1].to_i,line[4].to_i) if line[0] == "rotate" && line[1] == "row"
  screen.rotX!(line[2][2..-1].to_i,line[4].to_i) if line[0] == "rotate" && line[1] == "column"
  puts line.join " "
  puts screen.to_s
end
puts screen.lit
