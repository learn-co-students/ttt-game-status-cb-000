# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,4,8], #diagonal
  [2,4,6], #diagonal
  [0,3,6], #first column
  [1,4,7], #middle column
  [2,5,8] #last column
]


def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
      if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X") ||
        (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
        return win_combo
      end
  end
  return false
end

def full?(board)
  if board.include?(" ")
    return false
  else
    return true
  end
end

def draw?(board)
  if ((won?(board) == false) && (full?(board) == true))
    return true
  elsif won?(board) == true
    return false
  end
end

def over?(board)
  if (won?(board) == true) || (draw?(board) == true) || (full?(board) == true)
    return true
  end
  return false
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  end
  return nil
end
