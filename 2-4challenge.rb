def get_most_common_letter(text)
  counter = Hash.new(0)
  text.chars.each do |char|
    counter[char] += 1
  end
  sorted_counter = counter.to_a.sort_by { |k, v| v }.reverse!
  sorted_counter[0][0]
end

p get_most_common_letter("roof roof")


# Intended output:
# 
# > get_most_common_letter("the roof, the roof, the roof is on fire!")
# => "o"