gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'hamming'

class HammingTest < Minitest::Test
  #1
    def test_identical_strands
      assert_equal 0, Hamming.compute('A', 'A')
    end
  #2
    def test_long_identical_strands
      assert_equal 0, Hamming.compute('GGACTGA', 'GGACTGA')
    end
  #3
    def test_complete_distance_in_single_nucleotide_strands
      assert_equal 1, Hamming.compute('A', 'G')
    end
  #4
    def test_complete_distance_in_small_strands
      assert_equal 2, Hamming.compute('AG', 'CT')
    end
  #5
    def test_small_distance_in_small_strands
      assert_equal 1, Hamming.compute('AT', 'CT')
    end
  #6
    def test_small_distance
      assert_equal 1, Hamming.compute('GGACG', 'GGTCG')
    end
  #7
    def test_small_distance_in_long_strands
      assert_equal 2, Hamming.compute('ACCAGGG', 'ACTATGG')
    end
  #8
    def test_non_unique_character_in_first_strand
      assert_equal 1, Hamming.compute('AGA', 'AGG')
    end
  #9
    def test_non_unique_character_in_second_strand
      assert_equal 1, Hamming.compute('AGG', 'AGA')
    end
  #10
    def test_large_distance
      assert_equal 4, Hamming.compute('GATACA', 'GCATAA')
    end
  #11
    def test_large_distance_in_off_by_one_strand
      assert_equal 9, Hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT')
    end
  #12
    def test_empty_strands
      assert_equal 0, Hamming.compute('', '')
    end
  #13
    def test_disallow_first_strand_longer
      assert_raises(ArgumentError) { Hamming.compute('AATG', 'AAA') }
    end
  #14
    def test_disallow_second_strand_longer
      assert_raises(ArgumentError) { Hamming.compute('ATA', 'AGTG') }
    end
end
