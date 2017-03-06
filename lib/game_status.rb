# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  if won_empty?(board)
    false
  elsif won_draw?(board)
    false
  else
    determine_win(board)
  end
end

def full?(board)
  board.all? do | token |
    token == "X" || token == "O"
  end
end

def draw?(board)
  if !draw_first_row(board)
    false
  elsif draw_false?(board)
    true
  end
end

def over?(board)
  if draw_false?(board)
    true
  elsif !draw_first_row(board)
    true
  else
    false
  end
end

def winner(board)
  if (board[0] == "X" && board[1] == "X" && board[2] == "X") ||
     (board[3] == "X" && board[4] == "X" && board[5] == "X") ||
     (board[6] == "X" && board[7] == "X" && board[8] == "X") ||
     (board[0] == "X" && board[3] == "X" && board[6] == "X") ||
     (board[1] == "X" && board[4] == "X" && board[7] == "X") ||
     (board[2] == "X" && board[5] == "X" && board[8] == "X") ||
     (board[0] == "X" && board[4] == "X" && board[8] == "X") ||
     (board[2] == "X" && board[4] == "X" && board[6] == "X")
     return "X"
  elsif (board[0] == "O" && board[1] == "O" && board[2] == "O") ||
        (board[3] == "O" && board[4] == "O" && board[5] == "O") ||
        (board[6] == "O" && board[7] == "O" && board[8] == "O") ||
        (board[0] == "O" && board[3] == "O" && board[6] == "O") ||
        (board[1] == "O" && board[4] == "O" && board[7] == "O") ||
        (board[2] == "O" && board[5] == "O" && board[8] == "O") ||
        (board[0] == "O" && board[4] == "O" && board[8] == "O") ||
        (board[2] == "O" && board[4] == "O" && board[6] == "O")
        return "O"
  end
end

def won_empty?(board)
  board.all? do | token |
    token == " "
  end
end
def won_draw?(board)
  board.none? do | token |
    token == " "
  end
end
def draw_false?(board)
  return true if (draw_first_row(board) && board.none?{|token| token == " "})
end

def draw_first_row(board)
  if (board[0] == "X" && board[1] == "X" && board[2] == "X") || (board[0] == "O" && board[1] == "O" && board[2] == "O")
    return false
  elsif (board[3] == "X" && board[4] == "X" && board[5] == "X") || (board[3] == "O" && board[4] == "O" && board[5] == "O")
    return false
  elsif (board[6] == "X" && board[7] == "X" && board[8] == "X") || (board[6] == "O" && board[7] == "O" && board[8] == "O")
    return false
  elsif (board[0] == "X" && board[3] == "X" && board[6] == "X") || (board[0] == "O" && board[3] == "O" && board[6] == "O")
    return false
  elsif (board[1] == "X" && board[4] == "X" && board[7] == "X") || (board[1] == "O" && board[4] == "O" && board[7] == "O")
    return false
  elsif (board[2] == "X" && board[5] == "X" && board[8] == "X") || (board[2] == "O" && board[5] == "O" && board[8] == "O")
    return false
  elsif (board[0] == "X" && board[4] == "X" && board[8] == "X") || (board[0] == "O" && board[4] == "O" && board[8] == "O")
    return false
  elsif (board[2] == "X" && board[4] == "X" && board[6] == "X") || (board[2] == "O" && board[4] == "O" && board[6] == "O")
    return false
  else
    return true
  end
end

def determine_win(board)
  result = []
  WIN_COMBINATIONS.each do | combination |
    combination.each do | token |
      if position_taken?(board, token)
        result << token
      end
      if result.length == 3
        return result
      end
    end
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left-to-right diagonal
  [2,4,6]  # Right-to-left diagonal
]
