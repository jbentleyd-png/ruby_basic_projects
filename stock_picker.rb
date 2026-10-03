# A method that takes an array of prices happening over time to determine the best time to buy and the best time to sell.  


# turn an array of prices into an array of hashes recording the price and the day:
def hash_it(days_record)
  sorted_record = []
  days_record.each_with_index do |price, day|
    sorted_record.push({price: price, day: day + 1})
  end
  sorted_record
end

def sort_descending(sorted_record)
  sorted_record.sort_by! {|item| item[:price]}
  return sorted_record.reverse!
end
# outputs look like this:
# [{price: 9, day: 7}, {price: 6, day: 4}, {price: 5, day: 3}, {price: 4, day: 6}, {price: 3, day: 5}, {price: 3, day: 2}, {price: 2, day: 8}, {price: 1, day: 1}]


# finds the most profitable trades for each selling point:
def find_profitable_trades(sorted_record)
  profitable_trades = []
  sorted_record.each do |current_item|
    -1.downto(sorted_record.length * -1) do |i|
      if current_item[:day] > sorted_record[i][:day] && current_item[:price] != sorted_record[i][:price]
         profitable_trades.push({days: [sorted_record[i][:day], current_item[:day]], profit: current_item[:price] - sorted_record[i][:price]})
         break
      elsif current_item[:day] == sorted_record[i][:day] # avoid considering impossible trades
        break
      end
    end
  end
  profitable_trades
end

# tell user when to buy and sell:
def stock_picker(days_record)
  sorted_record = sort_descending(hash_it(days_record))
  profitable_trades = find_profitable_trades(sorted_record)

  unless profitable_trades.empty?
    best_trade = profitable_trades.max_by {|item| item[:profit]}
    return "You should buy on day #{best_trade[:days][0]} and sell on day #{best_trade[:days][1]} for a profit of #{best_trade[:profit]}." 
  end
  "No profits possible."
end

# test cases:
# p stock_picker([17,3,6,9,15,8,6,1,10])
# p stock_picker([17, 16, 3, 1])
# p stock_picker([17, 17])


# full process:
# hash_it([1,3,5,6,3,4,9,2])
# p sort_descending(hash_it([1,3,5,6,3,4,9,2]))
# p find_profitable_trades(sort_descending(hash_it([1,3,5,6,3,4,9,2])))
# p stock_picker([1,3,5,6,3,4,9,2])