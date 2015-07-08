module Enumerable 

  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    count = 0
    for i in self
      yield(i, count)
      count+=1
    end
  end

  def my_select
    new_array = []
    count = 0
    for i in self
      if yield(i)
        new_array[count] = i
        count+=1
      end
    end
    puts new_array
  end

  def my_all?
    all = true
    for i in self
      if yield(i)
      else
        all = false
        return all
      end
      return all
    end
  end

  def my_any?
    any = false
    for i in self
      if yield(i)
        any = true
      end
    end
    return any
  end

  def my_none?
    none = true
    for i in self
      if yield(i)
        none = false
      end
    end
    none
  end

  def my_count
    count = 0
    for i in self
      if yield(i)
        count+=1
      end
    end
    count
  end

  def my_map
    count = 0
    array = []
    for i in self
      array[count] = yield(i)
      count+=1
    end
    array
  end

  def my_inject n = 0
    array = [n] + self
    total = 0
    for i in array
      total = yield(total, i)
    end
    total
  end
end



my_array = [1,2,3,4,5,6,7,8,100]

puts my_array.my_inject{|sum, x| sum + x}