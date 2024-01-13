require 'csv'

path = 'input.csv'
row_calibrations_sum = 0

CSV.foreach(path) do |row|
  row_chars = row.first.split("")
  row_digits = row_chars.select { |element| element.match(/\d/) }
  row_calibration = (row_digits.first.to_i * 10) + row_digits.last.to_i
  row_calibrations_sum += row_calibration
end

p row_calibrations_sum
