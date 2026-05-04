def bubble_sort(array)
  if array.length == 0 || array.length == 1
    return "Cannot sort 0-1 items."
  end
  
  for macro_count in 0...(array.length - 1) # can run max array.length - 1 times
    swapped = false

    for micro_count in 0...(array.length - macro_count - 1) # top number should be sorted by first macro loop, 2nd highest by second, etc. 
      if array[micro_count] > array[micro_count + 1]
        holder = array[micro_count]
        array[micro_count] = array[micro_count + 1]
        array[micro_count + 1] = holder 
        swapped = true
      end
    end

    if swapped == false
      p "#{macro_count + 1} cycles"
      return array
    end


  end
  p "#{macro_count + 1} cycles"
  array # return if max cycles complete
end

# test cases:
puts bubble_sort([4,3,78,2,0,2])
puts "next"
puts bubble_sort([1, 2, 3, 4, 5])
puts "next"
puts bubble_sort([5, 4, 3, 2, 1])
puts "next"
puts bubble_sort([-5, 2, -1, 0, -10])
puts "next"
puts bubble_sort([42])
puts "next"
puts bubble_sort([])
puts "next"
