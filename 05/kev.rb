require 'digest'
input = 'abbhdwsy'
password = ""
password2 = "        "
n = 0
until password2[0..7].count("^ ") == 8
  h = Digest::MD5.hexdigest(input + n.to_s)
  if h.start_with?("00000")
    password << h[5]
    index = h[5].to_i
    password2[index] = h[6] if h[5] =~ /[0-7]/ and password2[index] == ' '
  end
  n += 1
end
puts "Part One: #{password}"
puts "Part Two: #{password2[1..8]}"
