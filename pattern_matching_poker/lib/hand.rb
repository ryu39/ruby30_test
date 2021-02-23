Hand = Struct.new(:cards) do
  def sort
    Hand[self.cards.sort]
  end

  def sort_by_rank
    Hand[self.cards.sort_by(&:rank_precedence)]
  end

  def to_s
    self.cards.map(&:to_s).join(', ')
  end
end
