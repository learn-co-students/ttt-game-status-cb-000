# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [

  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #right columns
  [1, 4, 7], #middle columns
  [2, 5, 8], #left columns
  [0, 4, 8], #diagonals
  [2, 4, 6] #diagonals

]
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  end
  return false
end
def full?(board)
  if board.include? (" ")
    return false
  else
    return true
  end

end
def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  if !full?(board) && !won?(board)
    return false
  end
  if won?(board)
    return false
  end

end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end
def winner(board)
  if won?(board) == false
    return nil
  else
    return board[won?(board)[1]]
  end
end
