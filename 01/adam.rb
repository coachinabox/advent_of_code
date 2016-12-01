def day_one
  array = "L1, R3, R1, L5, L2, L5, R4, L2, R2, R2, L2, R1, L5, R3, L4, L1, L2, R3, R5, L2, R5, L1, R2, L5, R4, R2, R2, L1, L1, R1, L3, L1, R1, L3, R5, R3, R3, L4, R4, L2, L4, R1, R1, L193, R2, L1, R54, R1, L1, R71, L4, R3, R191, R3, R2, L4, R3, R2, L2, L4, L5, R4, R1, L2, L2, L3, L2, L1, R4, R1, R5, R3, L5, R3, R4, L2, R3, L1, L3, L3, L5, L1, L3, L3, L1, R3, L3, L2, R1, L3, L1, R5, R4, R3, R2, R3, L1, L2, R4, L3, R1, L1, L1, R5, R2, R4, R5, L1, L1, R1, L2, L4, R3, L1, L3, R5, R4, R3, R3, L2, R2, L1, R4, R2, L3, L4, L2, R2, R2, L4, R3, R5, L2, R2, R4, R5, L2, L3, L2, R5, L4, L2, R3, L5, R2, L1, R1, R3, R3, L5, L2, L2, R5".split(", ")
  locations = [[0,0]]
  x, y = 0, 0 
  heading = 0 # 0n 90e 180s 270w
  array.each do |step|
    heading = (heading + (step[0] == "R" ? 1 : -1)) % 4
    for i in 1..step[1..step.length+1].to_i
      case heading
      when 0 ; y += 1
      when 1 ; x += 1
      when 2 ; y -= 1
      when 3 ; x -= 1
      end
      locations << [x,y] 
    end
  end
  answer_1 = x.abs + y.abs
  answer_2_xy = locations.detect{ |e| locations.count(e) > 1 }
  answer_2 = answer_2_xy[0].abs + answer_2_xy[1].abs

  p "Distance for question 1 is: #{answer_1}"
  p "Distance for question 2 is: #{answer_2}"
end
