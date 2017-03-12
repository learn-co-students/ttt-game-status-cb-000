# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left to Right Diagonal
  [2,4,6]  # Right to Left Diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    position_1  = board[win_index_1]
    position_2  = board[win_index_2]
    position_3  = board[win_index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combo
    end
  end

  return false
end

def full?(board)
  positions_taken = board.select do |position|
    position == "X" || position == "O"
  end

  if positions_taken.length == 9
    true
  else
    false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if over?(board) && !draw?(board)
    win_combo = won?(board)
    test_position = win_combo[0]
    return board[test_position]
  end
end
