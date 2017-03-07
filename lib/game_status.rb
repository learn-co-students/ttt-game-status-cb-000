board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATION constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Across left to right
  [2, 4, 6] # Across right to left
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]

    if position_1 == "X" && position_2 == "X"  && position_3 == "X"
      true
    elsif position_1 == "O" && position_2 == "O"  && position_3 == "O"
      true
    else
      false
    end
  end
end

def full?(board)
  board.each_index.all? do |i|
    position_taken?(board, i)
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) != nil
    if (won?(board).all? {|i| board[i] == "X"})
      "X"
    elsif (won?(board).all? {|i| board[i] == "O"})
      "O"
    end
  else
    nil
  end
end
