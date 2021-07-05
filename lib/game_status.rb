WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each { |combo|
    o_combo = combo.select { |i| board[i] == "O" }
    x_combo = combo.select { |i| board[i] == "X" }
    return o_combo if o_combo.count == 3
    return x_combo if x_combo.count == 3
  }
  return false
end

def full?(board)
  return board.all? { |e| e != " "  }
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif won?(board)
    return false
  end
end

def over?(board)
  return true if won?(board) or draw?(board)
end

def winner(board)
  win_combo = won?(board)
  return board[win_combo.first] if win_combo.class == Array
end
