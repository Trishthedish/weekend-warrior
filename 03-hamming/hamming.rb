# hamming.rb

class Hamming

  def self.compute(string1, string2)
# raise an argument error if
    if string1.length != string2.length
      raise ArgumentError
    end
# test if string 1 & 2 are idential?
    if string1 == string2
# if they are, add nothing.
      return 0
#other wise, (when they aren't equal)
    elsif string1 != string2
# one way to use logic that would pass even when you don't know the
# length of the string param.
      total = 0
      string1.each_char.with_index do |char1, index|
        if char1 != string2[index]
            total +=1
        end
      end
      return total
# this another more condensed way of doing it. both work, but the former was more instinctual 
      #     total = 0
      #     string1.length.times do |i|
      #       if string1[i] != string2[i]
      #         total +=1
      #       end
      #     end
      #     return total
      #  end
    end
  end
end

# 01 test_identical_strands
# Question: if they match return 0, (as in no differences), if they don't match, return 1. In the test case: 'A' & 'A' return 0.
# input: 2 strings
# output: 0

# 02 test_long_identical_strands
# input: 2 long identical strings
# output: 0

# 03 test_complete_distance_in_single_nucleotide_strands
# input: 2 single strand strings that are different
# output: 1

# 04 test_complete_distance_in_small_strands
#It will need to keep track of how many times its different.
# input: "AG" "CT"
# output: 2 (as in 2 total differneces)

# 05 test_small_distance_in_small_strands
# passed with earlier logic.

# 06 test - 12 test
# have been passed with similiar logic.

# 13: test_disallow_first_strand_longer
# played around with where to place this ArugmentError. Decided to place at the begining because. If it was longer from the start, no need to run through rest of tests.

# 14: test_disallow_second_strand_longer
# covered if placed at the begining.
