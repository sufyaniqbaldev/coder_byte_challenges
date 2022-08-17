def letter_count(str)
  words = str.split(" ");
  highest = 0;
  final = nil
  words.each do |word|
    chars = word.split('')
    chars = chars.sort
     previousChar = chars[0];
     charCount = 0
      chars.each do |c|
        if (c == previousChar)
            charCount += 1
        else
            if (charCount > highest)
                highest = charCount;
                final = word
            end
            charCount = 1
            previousChar = c
        end
      end

  end
  return highest == 1 ? "-1" : final;
end

puts letter_count("No words")
