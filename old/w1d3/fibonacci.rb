def fib(n)
  return [1] if n == 1

  prev_arr = fib(n-1)
  if prev_arr.size == 1
    current_val = prev_arr[-1]
  else
    current_val = prev_arr[-1] + prev_arr[-2]
  end

  prev_arr + [current_val]
end

p fib(7)
p fib(1)
