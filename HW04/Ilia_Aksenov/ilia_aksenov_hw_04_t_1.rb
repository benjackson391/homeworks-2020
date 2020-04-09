module Enumerable
  def my_map
    result = []
    while (value = shift)
      result << yield(value)
    end
    push(*result)
  end

  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_select
    result = []
    while (value = shift)
      result << value if yield(value)
    end
    push(*result)
  end
end
