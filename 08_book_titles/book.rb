# frozen_string_literal: true

# This is the class Book
class Book
  def title
    @title
  end

  def title=(title)
    articles = %w[of the a to in of on and over an]
    array_of_words = title.split(' ')
    word = array_of_words[0]
    array_of_words[0] = word.capitalize

    array_of_words.each_with_index do |w, i|
      array_of_words[i] = w.capitalize unless articles.include?(w)
    end

    @title=array_of_words.join(' ')
  end

end
