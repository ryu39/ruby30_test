class Board
  MOVE = /[XO]/.freeze

  def winner(board)
    case board
    in [
      [MOVE => move, ^move, ^move],
      [_, _, _],
      [_, _, _],
    ]
      [:horizontal, move]
    in [
      [_, _, _],
      [MOVE => move, ^move, ^move],
      [_, _, _],
    ]
      [:horizontal, move]
    in [
      [_, _, _],
      [_, _, _],
      [MOVE => move, ^move, ^move],
    ]
      [:horizontal, move]
    in [
      [MOVE => move, _, _],
      [^move, _, _],
      [^move, _, _],
    ]
      [:vertical, move]
    in [
      [_, MOVE => move, _],
      [_, ^move, _],
      [_, ^move, _],
    ]
      [:vertical, move]
    in [
      [_, _, MOVE => move],
      [_, _, ^move],
      [_, _, ^move],
    ]
      [:vertical, move]
    in [
      [MOVE => move, _, _],
      [_, ^move, _],
      [_, _, ^move],
    ]
      [:diagonal, move]
    in [
      [_, _, MOVE => move],
      [_, ^move, _],
      [^move, _, _],
    ]
      [:diagonal, move]
    else
      [:none, false]
    end
  end
end
