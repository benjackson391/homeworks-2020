require 'time'

class Mentor
  def initialize(name:, surname:)
    @name = name
    @surname = surname
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
    homeworks
  end

  def read_notifications!
    @subscribe_dates.each_key { |k| @subscribe_dates[k] = Time.new.to_i }
  end
end
