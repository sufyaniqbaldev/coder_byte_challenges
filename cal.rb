def calculator(str)
  result, stack, sign = 0, [], 1
  str = str.gsub(/\s+/, '')
  str.length.times do |i|
    current = str[i]
    if (current === '+')
      sign = 1
    elsif (current === '-')
      sign = -1
    elsif(current.to_i >= 0 && current.to_i <= 9)
       num = current.to_i
      while(i + 1 < str.length && str[i + 1] >= '0' && str[i + 1] <='9')
        num += str[i + 1].to_i
        i +=1
      end
       result += sign * num
    end
  end
  return result
end


puts calculator("4+4+ 6-1 ")
