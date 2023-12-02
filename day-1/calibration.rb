require 'csv'

path = 'input.csv'


row_calibrations_sum = 0

# Part 1

# CSV.foreach(path) do |row|
#   row_chars = row.first.split("")
#   row_digits = row_chars.select { |element| element.match(/\d/) }
#   row_calibration = (row_digits.first.to_i * 10) + row_digits.last.to_i
#   row_calibrations_sum += row_calibration
# end

# Part 2

LETTER_DIGIT = {
  one: 1,
  two: 2,
  three: 3,
  four: 4,
  five: 5,
  six: 6,
  seven: 7,
  eight: 8,
  nine: 9
}

STRING_NUMBERS = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

CSV.foreach(path) do |row|
  first_digit_regexp = Regexp.new(STRING_NUMBERS.join('|') + '|\d')
  second_digit_regexp = Regexp.new(STRING_NUMBERS.join('|').reverse + '|\d')
  first_digit = row.first.scan(first_digit_regexp).first
  last_digit = row.first.reverse.scan(second_digit_regexp).first
  row_calibration_strings = [first_digit, last_digit.reverse]
  row_calibration_numbers = row_calibration_strings.map do |el|
    el.match(/\d/) ? el.to_i : LETTER_DIGIT[el.to_sym]
  end
  row_calibration = (row_calibration_numbers.first * 10) + row_calibration_numbers.last
  row_calibrations_sum += row_calibration
end

p row_calibrations_sum
