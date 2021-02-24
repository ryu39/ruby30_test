require 'minitest/autorun'

require_relative '../lib/calculator'

class TestCalculator < Minitest::Test
  def setup
    @calculator = Calculator.new
  end

  def test_royal_flush
    hand = Hand.new([Card['S', '10'], Card['S', 'J'], Card['S', 'Q'], Card['S', 'K'], Card['S', 'A']])
    assert_equal @calculator.hand_score(hand), SCORES[:royal_flush]
  end

  def test_straight_flush
    hand = Hand.new([Card['S', '2'], Card['S', '3'], Card['S', '4'], Card['S', '5'], Card['S', '6']])
    assert_equal @calculator.hand_score(hand), SCORES[:straight_flush]
  end

  def test_four_of_a_kind_1
    hand = Hand.new([Card['S', '2'], Card['S', '3'], Card['H', '3'], Card['D', '3'], Card['C', '3']])
    assert_equal @calculator.hand_score(hand), SCORES[:four_of_a_kind]
  end

  def test_four_of_a_kind_2
    hand = Hand.new([Card['S', '3'], Card['H', '3'], Card['D', '3'], Card['C', '3'], Card['C', '4']])
    assert_equal @calculator.hand_score(hand), SCORES[:four_of_a_kind]
  end

  def test_full_house_1
    hand = Hand.new([Card['S', '2'], Card['H', '2'], Card['H', '3'], Card['D', '3'], Card['C', '3']])
    assert_equal @calculator.hand_score(hand), SCORES[:full_house]
  end

  def test_full_house_2
    hand = Hand.new([Card['S', '2'], Card['H', '2'], Card['D', '2'], Card['D', '3'], Card['C', '3']])
    assert_equal @calculator.hand_score(hand), SCORES[:full_house]
  end

  def test_flush
    hand = Hand.new([Card['S', '2'], Card['S', '4'], Card['S', '6'], Card['S', '8'], Card['S', '10']])
    assert_equal @calculator.hand_score(hand), SCORES[:flush]
  end

  def test_straight
    hand = Hand.new([Card['S', '2'], Card['C', '3'], Card['H', '4'], Card['D', '5'], Card['S', '6']])
    assert_equal @calculator.hand_score(hand), SCORES[:straight]
  end

  def test_three_of_a_kind_1
    hand = Hand.new([Card['S', '2'], Card['H', '2'], Card['D', '2'], Card['D', '3'], Card['C', '4']])
    assert_equal @calculator.hand_score(hand), SCORES[:three_of_a_kind]
  end

  def test_three_of_a_kind_2
    hand = Hand.new([Card['S', '2'], Card['S', '3'], Card['H', '3'], Card['D', '3'], Card['C', '4']])
    assert_equal @calculator.hand_score(hand), SCORES[:three_of_a_kind]
  end

  def test_three_of_a_kind_3
    hand = Hand.new([Card['S', '2'], Card['S', '3'], Card['S', '4'], Card['D', '4'], Card['C', '4']])
    assert_equal @calculator.hand_score(hand), SCORES[:three_of_a_kind]
  end

  def test_two_pair_1
    hand = Hand.new([Card['S', '2'], Card['H', '2'], Card['S', '3'], Card['H', '3'], Card['C', '4']])
    assert_equal @calculator.hand_score(hand), SCORES[:two_pair]
  end

  def test_two_pair_2
    hand = Hand.new([Card['S', '2'], Card['H', '2'], Card['C', '3'], Card['S', '4'], Card['H', '4']])
    assert_equal @calculator.hand_score(hand), SCORES[:two_pair]
  end

  def test_two_pair_3
    hand = Hand.new([Card['S', '2'], Card['S', '3'], Card['H', '3'], Card['S', '4'], Card['H', '4']])
    assert_equal @calculator.hand_score(hand), SCORES[:two_pair]
  end

  def test_one_pair_1
    hand = Hand.new([Card['S', '2'], Card['H', '2'], Card['S', '3'], Card['S', '4'], Card['S', '5']])
    assert_equal @calculator.hand_score(hand), SCORES[:one_pair]
  end

  def test_one_pair_2
    hand = Hand.new([Card['S', '2'], Card['S', '3'], Card['H', '3'], Card['S', '4'], Card['S', '5']])
    assert_equal @calculator.hand_score(hand), SCORES[:one_pair]
  end

  def test_one_pair_3
    hand = Hand.new([Card['S', '2'], Card['S', '3'], Card['S', '4'], Card['H', '4'], Card['S', '5']])
    assert_equal @calculator.hand_score(hand), SCORES[:one_pair]
  end

  def test_one_pair_4
    hand = Hand.new([Card['S', '2'], Card['S', '3'], Card['S', '4'], Card['S', '5'], Card['H', '5']])
    assert_equal @calculator.hand_score(hand), SCORES[:one_pair]
  end

  def test_high_card
    hand = Hand.new([Card['S', '2'], Card['H', '4'], Card['D', '6'], Card['C', '8'], Card['S', '10']])
    assert_equal @calculator.hand_score(hand), SCORES[:high_card]
  end
end
