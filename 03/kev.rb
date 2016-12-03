class Triangle
  attr_accessor :a,:b,:c
  def initialize(a,b,c)
    (@a, @b, @c) = a, b, c
  end
  
  def self.from_line(line)
    new(*(line.split.map(&:to_i)))
  end

  def invalid?
    a + b <= c || a + c <= b || b + c <= a
  end
end

x = 0
File.open('kev.txt').each_line do |line|
  triangle = Triangle.from_line(line)
  x += 1 unless triangle.invalid?
end
puts "Part 1: #{x}"

x = 0
File.open('kev.txt') do |f|
  until f.eof? do
    box = [f.gets, f.gets, f.gets].map{ |l| l.split.map(&:to_i) }
    x += 3 - box.transpose.count { |line| Triangle.new(*line).invalid? }
  end
end
puts "Part 2: #{x}"
