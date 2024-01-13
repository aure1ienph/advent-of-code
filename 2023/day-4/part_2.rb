require 'csv'

path = 'inputs/input.csv'
cards = []
counter = 0

CSV.foreach(path) do |row|
  card = row.first.gsub(/.*:/, '').split('|')
  cards << card
end

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
