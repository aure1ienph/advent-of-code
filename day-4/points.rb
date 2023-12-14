require 'csv'

path = 'input.csv'
cards = []
counter = 0

CSV.foreach(path) do |row|
  card = row.first.gsub(/.*:/, '').split('|')
  cards << card
end

# Part 1
# cards.each do |array|
#   winning_num = array.first.scan(/\d+/)
#   getted_num = array.last.scan(/\d+/)
#   common_values = winning_num & getted_num
#   nth = common_values.size

#   case nth
#   when 0
#     points = 0
#   when 1
#     points = 1
#   else
#     points = 1
#     (nth - 1).times do
#       points *= 2
#     end
#   end

#   counter += points
# end

# p counter

# Part 2

input = cards.each_with_index.map do |card, i|
  id = i
  winning_num = card.first.scan(/\d+/)
  getted_num = card.last.scan(/\d+/)
  win = winning_num & getted_num
  number_of_cards = 1
  {id: id, number_of_cards: number_of_cards, win: win.size}
end

input.each_with_index do |row, i|
  counter += row[:number_of_cards]
  row[:number_of_cards].times do
    wins = row[:win]
    index = i + 1
    wins.times do
      input[index][:number_of_cards] += 1
        index += 1
    end
  end
end

p counter
