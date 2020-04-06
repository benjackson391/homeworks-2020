require 'time'

class Person
  attr_accessor :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end
end

class Student < Person
  attr_accessor :homeworks

  def initialize(name:, surname:)
    super
    @homeworks = {}
  end

  def submit_homework!(homework = '')
    @homeworks[Time.now.to_i] = homework
  end
end

class Mentor < Person
  def initialize(name:, surname:)
    super
    @students = []
    @notifications = []
    @subscribe_dates = {}
  end

  def subscribe_to(student)
    @students << student
    @subscribe_dates[student.object_id] = Time.new.to_i
  end

  def notifications
    homeworks = []
    @students.each do |student|
      time = @subscribe_dates[student.object_id]
      homeworks.concat student.homeworks.select { |k| k > time }.values
    end
    p homeworks
  end

  def read_notifications!
    @subscribe_dates.each_key { |k| @subscribe_dates[k] = Time.new.to_i }
  end
end
