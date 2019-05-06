def translate(s)
  vowels = %w[a e i o u A E I O U]
  words_array = s.split(' ')

  words_array.each_with_index do |word, index|
    words_array[index] = word + 'ay' if vowels.include?(word[0])
    if !vowels.include?(word[0]) && !vowels .include?(word[1]) && !vowels.include?(word[2])
      words_array[index] = word[3..-1] + word[0..2] + 'ay'
    elsif !vowels.include?(word[0]) && !vowels.include?(word[1]) || word[0..1] == 'qu'
      words_array[index] = word[3..-1] + word[0..2] + 'ay' if word[0..2] == 'squ'
      words_array[index] = word[2..-1] + word[0..1] + 'ay' if word[0..2] != 'squ'
    elsif !vowels.include?(word[0])
      words_array[index] = word[1..-1] + word[0] + 'ay'
    end
  end

  words_array.join(' ')

end
