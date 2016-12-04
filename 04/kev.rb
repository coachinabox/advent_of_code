class Room
  attr_accessor :sector, :csum, :ename
  def initialize(code)
    (@ename,@sector,@csum) = /([a-z-]+)(\d+)\[(\w+)\]/.match(code).captures
    @ename.chop!
    @sector = @sector.to_i
  end

  def letter_count
    count = {}
    ename.delete('-').each_char do |c|
      count[c] = count[c].nil? ? 1 : count[c] + 1
    end
    count
  end

  def calc_checksum
    lc = letter_count
    lc.keys.sort do |a,b|
      comp = (lc[b] <=> lc[a])
      comp.zero? ? (a <=> b) : comp
    end.first(5).join
  end

  def valid?
    csum == calc_checksum
  end

  def unencrypted_name(times = @sector, name = @ename)
    return name if times == 0
    unencrypted_name(
      times - 1,
      name.chars.map{ |c| c == '-' ? '-' : c.next.chr }.join
    ).split('-').join(' ')
  end
end

rooms = [];part2 = nil;
sum = File.open('kev.txt').read.lines.reduce(0) do |sum,l|
  room = Room.new(l)
  name = room.unencrypted_name
  part2 = "Part two: #{room.sector}" if name == "northpole object storage"
  sum += room.sector if room.valid?
  sum
end
puts "Part One: #{sum}"
puts "Part Two: #{part2}"
