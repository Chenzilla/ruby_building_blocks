def bubble_sort_by array
  sorted = false
  while sorted == false
    count = 0
    sorted = true
    while count < array.length - 1
      current = array[count]
      following = array[count + 1]
      puts yield(current, following)
      if yield(current, following) < 0
        array[count] = following
        array[count + 1] = current
        sorted = false
      end
      count += 1
    end
  end
  puts array
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
     right.length - left.length
end