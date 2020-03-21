def parse(filepath)
  data = File.open(filepath).readlines.map(&:chomp)
  data.grep(/error/i)
end

puts 'This script can find errors in log file. Please, enter filepath: '
data = parse(gets.strip)
data.empty? ? puts('') : data.each { |l| puts l }
