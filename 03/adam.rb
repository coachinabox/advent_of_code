def day_three_part_one input
  valid = 0
  input.each_line do |triangle|
    sides = triangle.split(" ").map {|s|s.to_i}.sort
    valid += 1 if sides[0] + sides[1] > sides[2]
  end
  puts "valid triangle count: #{valid}"
end

def day_three_part_two input
  valid = 0
  input.each_slice(3).to_a.each do |three_triangles|
    three_triangles.map{|s|s.split(" ").map{|l|l.to_i}}.transpose.each do |triangle|
      sides = triangle.sort
      valid += 1 if sides[0] + sides[1] > sides[2]
    end
  end
  puts "valid triangle count: #{valid}"
end

day_three_part_one File.open("adam_input.txt")
day_three_part_two File.open("adam_input.txt")