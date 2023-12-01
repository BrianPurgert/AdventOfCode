def sum_calibration_values(file_path)
  digit_map = {
    'one' => '1',
    'two' => '2',
    'three' => '3',
    'four' => '4',
    'five' => '5',
    'six' => '6',
    'seven' => '7',
    'eight' => '8',
    'nine' => '9'
  }

  sum = 0
  File.open(file_path, 'r') do |f|
    f.each_line do |line|
      digit_map.each do |word, digit|
        line.gsub!(word, digit)
      end
      first_digit = line[/\d/]
      last_digit = line[/\d(?=[^\d]*$)/]
      sum += "#{first_digit}#{last_digit}".to_i if first_digit && last_digit
    end
  end
  sum
end

puts sum_calibration_values('01/input.txt')