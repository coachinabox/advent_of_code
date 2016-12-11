input = IO.read('kev.txt').split("")
count = 0
multipliers = []
until input == [] do
	letter = input.shift
	if letter == "("
		ins = ""
		until ins[-1,1] == ")"; ins << input.shift end
		multipliers = multipliers.map{|x| [x.first - (ins.length + 1), x.last]}.reject{|x| x.first <= 0}
		multipliers << ins.chop.split("x").map(&:to_i )
	else
	  count += multipliers.reduce(1){ |total,n| n.last * total } if letter =~ /[A-Z]/
  	multipliers = multipliers.map{|x| [x.first - 1, x.last]}.reject{|x| x.first == 0}
	end
end
puts "Part Two: #{count}"
