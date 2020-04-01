require 'time'

class Student
  attr_accessor :homeworks

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @homeworks = {}
  end

  def submit_homework!(homework = '')
    @homeworks[Time.now.to_i] = homework
  end
end
