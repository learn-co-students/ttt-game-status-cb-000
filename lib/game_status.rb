# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # first diagonal pattern
  [2, 4, 6] # second diagonal pattern
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    position_1 = win_combo[0]
    position_2 = win_combo[1]
    position_3 = win_combo[2]
    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      return [position_1, position_2, position_3]
    elsif
      board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return [position_1, position_2, position_3]
    end
  end
  return false
end

def full?(board)
  board.all? do |space|
  space != " "
end
end

def draw?(board)
  if full?(board) == true &&
    won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) == true
    return true
  elsif won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)
unless won?(board) == false
  pos_1 = won?(board)[0]
  pos_2 = won?(board)[1]
  pos_3 = won?(board)[2]
  if board[pos_1] == "X" && board[pos_2] == "X" && board[pos_3] == "X"
    return "X"
  elsif board[pos_1] == "O" && board[pos_2] == "O" && board[pos_3] == "O"
    return "O"
  end
end
return nil
end


board = ["O", " ", " ", " ", "O", " ", " ", " ", "O"]
puts winner(board)
