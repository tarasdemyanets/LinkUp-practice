class Friend
  def greeting(who = '')
    if who == ''
      'Hello!'
    else
      "Hello, #{who}!"
    end
  end
end
