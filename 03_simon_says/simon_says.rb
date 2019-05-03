def echo(s)
  return s
end

def shout(s)
  return s.upcase
end

def repeat(s, repeat=2)
  s += ' '
  s *= repeat
  s = s.strip
  s
end

def start_of_word(word, letters)
  word[0..letters - 1]
end

def first_word(s)
  s = s.split(' ')
  word = s[0]
  word
end

def titleize(expression)
  articles = %w[of the a to in of on and over]
  array_of_words = expression.split(' ')
  word = array_of_words[0]
  array_of_words[0] = word.capitalize
  array_of_words.each_with_index do |w, i|
    array_of_words[i] = w.capitalize unless articles.include?(w)
  end
  array_of_words.join(' ')
end
