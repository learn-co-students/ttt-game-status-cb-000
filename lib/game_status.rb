# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Middle column
  [2,5,8], # Last column
  [0,4,8], # Left diagonal
  [2,4,6]  # Right diagonal
]

# Won? method checks to see if a win condition is method
def won? board
  WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
  end
  return false
end

## Full? checks to see if all array elements are taken
def full? board
  board.all? do |index|
    !(index.nil? || index == " ")
  end
end

## Draw? return true is full? is true, but won? is false
def draw? board
  if full?(board) && !(won?(board))
    true
  else
    false
  end
end

## Over? returns true if won? is true, ?full is true, or ?draw is true
def over? board
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

## Winner returns the winner's token 'X' or 'O'
def winner board
  if won?(board)
    token = won?(board)
    return board[token[0]]
  else
    nil
  end
end
