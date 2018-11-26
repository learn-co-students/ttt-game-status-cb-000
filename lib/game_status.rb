# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]
def x_won?(win_combo, board)
  win_combo.all? do |index|
    board[index] == "X"
  end
end

def o_won?(win_combo, board)
  win_combo.all? do |index|
    board[index] == "O"
  end
end

def won?(board)
  winner = []
  WIN_COMBINATIONS.each do |win_combo|
    if x_won?(win_combo, board) == true
      winner = win_combo
    elsif o_won?(win_combo, board) == true
      winner = win_combo
    end
  end
  if winner == []
    return false
  end
  return winner
end

def full?(board)
  board.all? do |space|
    space == 'X' || space == 'O'
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false
    return true
  elsif full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  value = won?(board)
  if value == false
    return nil
  else
    something = value[0]
    spot = board[something]
    if spot == "X"
      return "X"
    else
      return "O"
    end
  end
end
