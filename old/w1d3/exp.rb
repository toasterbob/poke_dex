def exp_1(b,n)
  return 1 if n == 0

  b * exp_1(b, n - 1)
end

def exp_2(b,n)
  return 1 if n == 0
  if n.even?
    calc = exp_2(b, n/2)
    calc * calc
  elsif n.odd?
    calc = exp_2(b, (n-1)/ 2)
    b * (calc * calc)
  end
end


p exp_2(2, 4)
p exp_2(2, 0)
p exp_2(3, 1)
p exp_1(3, 1)
p exp_2(3, 3)
