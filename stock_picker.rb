def stock_picker(days_record)
  hashed_record = []

  days_record.each_with_index do |price, day|
    hashed_record.push({price: price, day: day})
  end
  hashed_record.sort_by! {|item| item[:price]}
  hashed_record.reverse!


  best_possible_trades = []
  
  hashed_record.each do |current_item|
    -1.downto(hashed_record.length * -1) do |i|
      if current_item[:day] > hashed_record[i][:day]
         best_possible_trades.push({days: [hashed_record[i][:day], current_item[:day]], profit: current_item[:price] - hashed_record[i][:price]})
         break
      elsif current_item[:day] == hashed_record[i][:day]
        break
      end
    end
  end

  unless best_possible_trades.empty?
    best_trade = best_possible_trades.max_by {|item| item[:profit]}
    return best_trade[:days]
  end
  "No profits possible."
end


p stock_picker([17,3,6,9,15,8,6,1,10])
p stock_picker([17, 16, 3, 1])
p stock_picker([17,6,9,15,8,6,10,3,1])