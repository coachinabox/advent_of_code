class Direction
  DIRS = ["N","E","S","W"]

  def initialize
    @dir_point = 0
    @x = 0
    @y = 0
    @path = []
  end 

  def direction
    DIRS[@dir_point]
  end

  def move(dist)
    1.upto(dist) do |step|
      @x = @x + 1 if direction == "E"
      @x = @x - 1 if direction == "W"
      @y = @y + 1 if direction == "N"
      @y = @y - 1 if direction == "S"
      puts "Now at #{@x},#{@y}"
      puts "Visited #{@x},#{@y} before! It's #{total} blocks away!" if @path.include? [@x,@y]
      @path << [@x,@y]
    end
  end

  def l
    @dir_point = @dir_point - 1
    @dir_point = 3 if @dir_point == -1
    puts "Turning left to #{direction}"
  end

  def r
    @dir_point = @dir_point + 1
    @dir_point = 0 if @dir_point == 4
    puts "Turning right to #{direction}"
  end

  def total
    @x.abs + @y.abs
  end
end

a=IO.read('kev.txt').split(", ")

dir = Direction.new

a.each do |i|
  dir.l if i[0] == "L"
  dir.r if i[0] == "R"
  dir.move(i[1..-1].to_i)
end

puts "Final distance is #{dir.total}"

