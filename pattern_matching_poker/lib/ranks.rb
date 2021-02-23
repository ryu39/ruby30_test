RANKS        = [*2..10, *%w(J Q K A)].map(&:to_s).freeze
# { '2' => 0, '3' => 1, ..., 'A' => 12 }
RANKS_SCORES = RANKS.each_with_index.to_h
