# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won? (board)
  WIN_COMBINATIONS.each { |win_combo|
    if (position_taken?(board, win_combo[0]) &&
        board[win_combo[0]] == board[win_combo[1]] &&
        board[win_combo[0]] == board[win_combo[2]])
      return win_combo
    end
  }
  return nil
end

def full?(board)
  return !(board.include?("") || board.include?(" ") || board.include?(nil))
end

def draw?(board)
  return !won?(board) && full?(board)
end

def over?(board)
  return won?(board) || draw?(board)
end

def winner(board)
  winning_indices = won?(board)
  return (winning_indices == nil) ? nil : board[winning_indices[0]]
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # rows
  [0,1,2],
  [3,4,5],
  [6,7,8],
  # columns
  [0,3,6],
  [1,4,7],
  [2,5,8],
  # diagonals
  [0,4,8],
  [2,4,6]
]