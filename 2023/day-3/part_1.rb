require 'csv'

input = 'input.csv'
array_input = []
part_numbers = 0

CSV.foreach(input) do |row|
  array_input << row.first
end

regexp = Regexp.new(/[-$%+&\/@=#*]/)

array_input.each_with_index do |row, i|
  previous_row = array_input[i - 1]
  next_row = array_input[i + 1]
  numbers = row.scan(/\d+/)

  numbers.each do |number|
    start_index = row.index(number)
    end_index = (start_index + number.size - 1)

    start_index -= 1 if start_index > 0
    end_index += 1 if end_index < (row.size - 1)

    index_range = (start_index..end_index)

    sym_on_previous = i > 0 ? previous_row[index_range].match?(regexp) : nil
    sym_on_start = row[start_index].match?(regexp)
    sym_on_end = row[end_index].match?(regexp)
    sym_on_next = i < (array_input.size - 1) ? next_row[index_range].match?(regexp) : nil

    if sym_on_previous || sym_on_start || sym_on_end || sym_on_next
      part_numbers += number.to_i
    end
  end
end

p part_numbers

# Fail to get the answer :/
