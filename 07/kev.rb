class String
  def abba?
    0.upto(length - 3) do |x|
  		return true if self[x] == self[x + 3] && self[x + 1] == self[x + 2] && self[x] != self[x + 1]
    end
  	false
  end

	def abas
		(0..(length - 3)).map{ |x| self[x,3] }.select{ |s| s[0] == s[2] && s[0] != s[1] }
	end

	def bab?(aba)
		if aba.is_a? Array
			aba.detect{|x| bab?(x)}
		else
			self =~ /#{aba[1]}#{aba[0]}#{aba[1]}/
		end
	end
end

p1 = p2 = 0
File.open("kev.txt").each_line do |line|
  nobrackets = line.gsub(/\[[^\]]*\]/,":")
  inbrackets = line.scan(/\[[^\]]*\]/).to_a
	p2 += 1 if inbrackets.detect{|x| x.bab?(nobrackets.abas)}
	next if inbrackets.detect(&:abba?)
	p1 += 1 if nobrackets.abba?
end
puts "Part One: #{p1}"
puts "Part Two: #{p2}"
