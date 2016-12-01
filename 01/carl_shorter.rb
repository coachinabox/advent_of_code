def day_one
  input = 'L4, L1, R4, R1, R1, L3, R5, L5, L2, L3, R2, R1, L4, R5, R4, L2, R1, R3, L5, R1, L3, L2, R5, L4, L5, R1, R2, L1, R5, L3, R2, R2, L1, R5, R2, L1, L1, R2, L1, R1, L2, L2, R4, R3, R2, L3, L188, L3, R2, R54, R1, R1, L2, L4, L3, L2, R3, L1, L1, R3, R5, L1, R5, L1, L1, R2, R4, R4, L5, L4, L1, R2, R4, R5, L2, L3, R5, L5, R1, R5, L2, R4, L2, L1, R4, R3, R4, L4, R3, L4, R78, R2, L3, R188, R2, R3, L2, R2, R3, R1, R5, R1, L1, L1, R4, R2, R1, R5, L1, R4, L4, R2, R5, L2, L5, R4, L3, L2, R1, R1, L5, L4, R1, L5, L1, L5, L1, L4, L3, L5, R4, R5, R2, L5, R5, R5, R4, R2, L1, L2, R3, R5, R5, R5, L2, L1, R4, R3, R1, L4, L2, L3, R2, L3, L5, L2, L2, L1, L2, R5, L2, L2, L3, L1, R1, L4, R2, L4, R3, R5, R3, R4, R1, R5, L3, L5, L5, L3, L2, L1, R3, L4, R3, R2, L1, R3, R1, L2, R4, L3, L3, L3, L1, L2'.split(', ')
  x, y = 0, 0
  locations = [[x,y]]
  directions = ['N', 'E', 'S', 'W']
  dir = 0
  input.each do |move|
    move[0] == 'R' ? dir += 1 : dir -= 1
    dir == 4 ? dir = 0 : dir = dir
    dir == -5 ? dir = 3 : dir = dir
    direction = directions[dir]
    for i in 1..move[1..move.length + 1].to_i
      case direction
      when 'N' ; y += 1
      when 'E' ; x += 1
      when 'S' ; y -= 1
      when 'W' ; x -= 1
      end
      locations << [[x,y]]
    end
  end
    answer_one = x.abs + y.abs
    dupe = locations.detect { |location| locations.count(location) > 1 }
    answer_two = dupe[0][0].abs + dupe[0][1].abs
    print answer_one.to_s + ' , ' + answer_two.to_s
end

day_one
