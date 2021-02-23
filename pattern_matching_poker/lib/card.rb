require_relative 'ranks'
require_relative 'suits'

Card = Struct.new(:suit, :rank) do
  include Comparable

  # => "[0, 9]"
  def precedence
    [SUITS_SCORES[self.suit], RANKS_SCORES[self.rank]]
  end

  # => 0
  def suit_precedence
    SUITS_SCORES[self.suit]
  end

  # => 9
  def rank_precedence
    RANKS_SCORES[self.rank]
  end

  # "S9" > "S2"
  # "S9" < "SJ"
  # "S9" < "H2"
  def <=>(other)
    self.precedence <=> other.precedence
  end

  def to_s
    "#{self.suit}#{self.rank}"
  end
end
