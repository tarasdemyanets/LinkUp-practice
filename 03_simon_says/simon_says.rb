def echo(s)
  return s
end
def shout(s)
  return s.upcase
end
def repeat(s, repeat=2)
  s=s+" "
  s=s*repeat
  s=s.strip
  return s
end
def start_of_word(s,letters)
  s=s[0..letters-1]
end
def first_word(s)
  s=s.split(" ")
  first_word=s[0]
  return first_word
end
def titleize(s)
  articles=["of","the","a", "to", "in", "of", "on","and","over"]
  array_of_words=s.split(" ")
  w=array_of_words[0]
  array_of_words[0]=w.capitalize
  if array_of_words.length==1
    s=s.capitalize
  else
  for i in 1..array_of_words.length-1
    includes=false
    word=array_of_words[i]
    for j in 0..articles.length
      if word == articles[j]
        includes=true
      end
    end
    if includes==true
    else
      array_of_words[i]=word.capitalize
    end
  end
  s=array_of_words.join(" ")
end
  return s
end
