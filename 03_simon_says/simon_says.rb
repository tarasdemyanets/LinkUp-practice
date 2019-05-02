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
