require 'csv'

path = 'input.csv'
row_calibrations_sum = 0

DIGIT = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8, nine: 9 }

CSV.foreach(path) do |row|
  regexp_1 = Regexp.new(DIGIT.keys.join('|') + '|\d')
  regexp_2 = Regexp.new(DIGIT.keys.join('|').reverse + '|\d')
  first_digit = row.first.scan(regexp_1).first
  last_digit = row.first.reverse.scan(regexp_2).first
  row_calibration_strings = [first_digit, last_digit.reverse]
  row_calibration_numbers = row_calibration_strings.map do |el|
    el.match(/\d/) ? el.to_i : DIGIT[el.to_sym]
  end
  row_calibration = (row_calibration_numbers.first * 10) + row_calibration_numbers.last
  row_calibrations_sum += row_calibration
end

p row_calibrations_sum
