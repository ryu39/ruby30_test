require_relative 'suits'
require_relative 'ranks'
require_relative 'card'
require_relative 'hand'

# { :high_card => 1, :one_pair => 2, ..., :royal_flush => 10 }
SCORES = %i(
  royal_flush
  straight_flush
  four_of_a_kind
  full_house
  flush
  straight
  three_of_a_kind
  two_pair
  one_pair
  high_card
).reverse_each.with_index(1).to_h.freeze

# [Card["S", "2"], Card["S", "3"], ..., Card["C", "A"]]
CARDS = SUITS.product(RANKS).map { |(s, r)| Card[s, r] }.freeze

class Calculator
  def hand_score(unsorted_hand)
    hand = unsorted_hand.sort_by_rank.cards

    is_straight = -> hand {
      hand
        .map { RANKS_SCORES[_1.rank] }
        .sort
        .each_cons(2)
        .all? { |a, b| b - a == 1 }
    }

    return SCORES[:royal_flush] if hand in [
      Card[s, '10'], Card[^s, 'J'], Card[^s, 'Q'], Card[^s, 'K'], Card[^s, 'A']
    ]
    return SCORES[:straight_flush] if is_straight[hand] && hand in [
      Card[s, *], Card[^s, *], Card[^s, *], Card[^s, *], Card[^s, *]
    ]
    return SCORES[:four_of_a_kind] if hand in [
      *, Card[*, r], Card[*, ^r], Card[*, ^r], Card[*, ^r], *
    ]
    return SCORES[:full_house] if hand in [
      Card[*, r1], Card[*, ^r1], Card[*, ^r1], Card[*, r2], Card[*, ^r2]
    ]
    return SCORES[:full_house] if hand in [
      Card[*, r1], Card[*, ^r1], Card[*, r2], Card[*, ^r2], Card[*, ^r2]
    ]
    return SCORES[:flush] if hand in [
      Card[s, *], Card[^s, *], Card[^s, *], Card[^s, *], Card[^s, *]
    ]
    return SCORES[:straight] if is_straight[hand]
    return SCORES[:three_of_a_kind] if hand in [
      *, Card[*, r], Card[*, ^r], Card[*, ^r], *
    ]
    return SCORES[:two_pair] if hand in [
      *, Card[*, r1], Card[*, ^r1], Card[*, r2], Card[*, ^r2], *
    ]
    return SCORES[:two_pair] if hand in [
      Card[*, r1], Card[*, ^r1], *, Card[*, r2], Card[*, ^r2]
    ]
    return SCORES[:one_pair] if hand in [
      *, Card[*, r], Card[*, ^r], *
    ]
    SCORES[:high_card]
  end
end
