module Enumerable 

  def my_each

    return self.to_enum if !block_given?

    for i in self
      yield(i)
    end
  end

  def my_each_with_index

    return self.to_enum if !block_given?

    count = 0
    for i in self
      yield(i, count)
      count += 1
    end
  end

  def my_select

    return self.to_enum if !block_given?

    new_array = []
    for i in self
      new_array << i if yield(i)
    end
    new_array
  end

  def my_all?

    return self.to_enum if !block_given?

    all = true
    for i in self
      all = false if !yield(i)
    end
    all
  end

  def my_any?

    return self.to_enum if !block_given?

    for i in self
      return true if yield(i)
    end
    return false
  end

  def my_none?

    return self.to_enum if !block_given?

    for i in self
      return false if yield(i)
    end
    return true
  end

  def my_count

    return self.to_enum if !block_given?

    count = 0
    for i in self
      if yield(i)
        count+=1
      end
    end
    count
  end

  def my_map

    return self.to_enum if !block_given?

    count = 0
    array = []
    for i in self
      array[count] = yield(i)
      count+=1
    end
    array
  end

  def my_inject n = 0

    return self.to_enum if !block_given?

    array = [n] + self
    total = 0
    for i in array
      total = yield(total, i)
    end
    total
  end
end



# my_array = [1,2,3,4,5,6,7,8,100]
# puts my_array.my_inject{|sum, x| sum + x}
# #result => 136