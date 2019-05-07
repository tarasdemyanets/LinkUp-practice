# frozen_string_literal: true

# Dictionary class description
class Dictionary
  def initialize
    @dictionary = {}
  end

  def entries
    @dictionary
  end

  def keywords
    @dictionary.keys.sort
  end

  def add(hash)
    hash = { hash => nil } unless hash.is_a?(Hash)
    @dictionary = @dictionary.merge(hash)
  end

  def include?(key)
    keys = @dictionary.keys
    keys.include?(key)
  end

  def find(key)
    hash = {}
    keys = @dictionary.keys
    keys.each do |hash_key|
      hash = hash.merge(hash_key => @dictionary[hash_key]) if hash_key.include?(key) && @dictionary[hash_key]!=nil
    end
    hash
  end

  def printable
    keys = @dictionary.keys.sort
    keys.map { |key| %([#{key}] "#{@dictionary[key]}") }.join("\n")
  end
end
