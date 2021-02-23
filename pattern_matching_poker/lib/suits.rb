SUITS        = %w(S H D C).freeze
# { 'S' => 0, 'H' => 1, ... }
SUITS_SCORES = SUITS.each_with_index.to_h
