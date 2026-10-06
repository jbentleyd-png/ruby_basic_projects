def bubble_sort(array)
  return "Cannot sort 0-1 items." if array.length <= 1
  
  for macro_count in 0...(array.length - 1) # mathematically, it will be sorted after length-1 iterations at the latest 
    swapped = false

    for micro_count in 0...(array.length - macro_count - 1) # highest number will be at the end after one iteration, 2nd highest after 2nd, etc. 
      if array[micro_count] > array[micro_count + 1]
        holder = array[micro_count]
        array[micro_count] = array[micro_count + 1]
        array[micro_count + 1] = holder 
        swapped = true
      end
    end

    return array if swapped == false
  end
  array # return if max cycles complete
end

# TEST CASES:
puts "[4,3,78,2,0,2] sorted:"
p bubble_sort([4, 3, 78, 2, 0, 2])
puts "[1, 2, 3, 4, 5] sorted:"
p bubble_sort([1, 2, 3, 4, 5])
puts "[5, 4, 3, 2, 1] sorted:"
p bubble_sort([5, 4, 3, 2, 1])
puts "[-5, 2, -1, 0, -10] sorted:"
p bubble_sort([-5, 2, -1, 0, -10])
puts "[42] sorted:"
p bubble_sort([42])
puts "[] sorted:"
p bubble_sort([])
