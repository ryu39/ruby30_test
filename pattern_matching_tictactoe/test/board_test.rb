require 'minitest/autorun'

require_relative '../lib/board'

class TestBoard < Minitest::Test
  def setup
    @board = Board.new
  end

  def test_horizontals
    assert_equal @board.winner(board('XXX', '   ', '   ')), [:horizontal, 'X']
    assert_equal @board.winner(board('   ', 'OOO', '   ')), [:horizontal, 'O']
    assert_equal @board.winner(board('   ', '   ', 'XXX')), [:horizontal, 'X']

    assert_equal @board.winner(board('X X', '   ', '   ')), [:none, false]
    assert_equal @board.winner(board('   ', 'O O', '   ')), [:none, false]
    assert_equal @board.winner(board('   ', '   ', 'X X')), [:none, false]
  end

  def test_verticals
    assert_equal @board.winner(board('X  ', 'X  ', 'X  ')), [:vertical, 'X']
    assert_equal @board.winner(board(' O ', ' O ', ' O ')), [:vertical, 'O']
    assert_equal @board.winner(board('  X', '  X', '  X')), [:vertical, 'X']

    assert_equal @board.winner(board('   ', 'X  ', 'X  ')), [:none, false]
    assert_equal @board.winner(board(' O ', '   ', ' O ')), [:none, false]
    assert_equal @board.winner(board('  X', '  X', '   ')), [:none, false]
  end

  def test_diagonals
    assert_equal @board.winner(board('O  ', ' O ', '  O')), [:diagonal, 'O']
    assert_equal @board.winner(board('  X', ' X ', 'X  ')), [:diagonal, 'X']

    assert_equal @board.winner(board('O  ', ' O ', '   ')), [:none, false]
    assert_equal @board.winner(board('  X', ' X ', '   ')), [:none, false]
  end

  private

  # ('XOX', 'OXO', 'XXO') => [['X', 'O', 'X'], ['O', 'X', 'O'], ['X', 'X', 'O']]
  def board(*rows) = rows.map(&:chars)
end
