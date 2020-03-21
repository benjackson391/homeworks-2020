def task_2(filepath)
  data = File.open(filepath).readlines.map(&:chomp)
  r = %r{^([\d\.]{7,15})[-\s]{5}\[(.+)\]\s\"\w{3,6}\s([\/\w+]+).+$}
  data.grep(r).map { |i| i.sub!(r, '\2 from: \1 to \3') && i.upcase }
end

puts 'This script can find errors in log file. Please, enter filepath: '
data = task_2(gets.strip)
data.empty? ? puts('not found') : data.each { |l| puts l }
