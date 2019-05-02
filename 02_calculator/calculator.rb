def add(a,b)
  a+b
  end
def subtract(a,b)
  a-b
end
def sum(a)
  a.sum
end
def multiply(a,b)
  a*b
end
def power(a,b)
  a**b
end
def factorial(n)
  if n<0
    return nil
  end
  if n ==0
    1
  end
  res=1
  while n>0
    res=res*n
      n-=1
    end
    return res
end
