def calculator(str)
  number, stack, oprator = 0, [], "+"
  str = str.gsub(/\s+/, '') + "+"
  str.split('').each_with_index do |ch, i|
      if ch.scan(/\d/)&.first&.to_i&.positive?
        number = number * 10 + ch.to_i
      end
      if ch == "("
        stack.push(oprator)
        stack.push('(')
        oprator = '+'
      end
      if "+-*/)".include? ch  ||  i == str.length - 1
        if oprator == "*"
            stack.push(stack.pop.to_i * number.to_i)
        elsif oprator == '/'
            stack.push(stack.pop.to_i / number.to_i)
        elsif oprator == "+"
            stack.push(number)
        elsif oprator == "-"
            stack.push(-number)
        end
        if ch == ')'
            number, item = 0, stack.pop
            while item != '('
                number += item
                item = stack.pop
            end
            oprator = stack.pop
        else
            number = 0
            oprator = ch
        end
      end
  end
  return stack.sum()
end

puts calculator("6*(4/2)+3*1")
