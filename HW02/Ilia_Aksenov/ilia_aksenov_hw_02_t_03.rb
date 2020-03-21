require 'time'

def format(time)
  "#{time.to_i}.#{time.usec}".to_f
end

def open_file(filepath)
  File.open(filepath).readlines.map(&:chomp)
end

def parse(data, ranges = [], last = 0)
  r = /(.{21})\s([\w-]+)\[(\d+)\]\s(\w+)\s-\s(.+)$/
  data.each do |s|
    res = s.match(r)
    t = format(Time.parse(res[1]))
    next unless res[5] =~ /Calling core with action/

    ranges.push(t.send('-', last).round(1)) if last != 0
    last = t
  end
  ranges
end

puts 'This script can find errors in log file. Please, enter filepath: '
puts parse(open_file(gets.strip))
