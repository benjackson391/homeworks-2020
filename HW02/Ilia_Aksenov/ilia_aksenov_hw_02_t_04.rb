require 'time'

def task_4(str)
  data = { letters: 0, digits: 0 }
  l = str.scan(/[a-z]/)
  d = str.scan(/\d/)
  data[:letters] = l ? l.size : 0
  data[:digits] = d ? d.size : 0
  data
end

puts 'This script can find errors in log file. Please, enter filepath: '
puts task_4(gets.strip)
