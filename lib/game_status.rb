# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7],  # Middle column
  [2,5,8], # Right row
  [0,4,8], # Horizontal left to right
  [2,4,6]  # Horizontal right to left
]

def won?(board)
  x_positions = []
  o_positions = []
  board.each_index do |position|
    if board[position] == "X"
      x_positions << position
    elsif board[position] == "O"
      o_positions << position
    end
  end
  WIN_COMBINATIONS.each do |win_combo|
    if (win_combo - x_positions).empty? || (win_combo - o_positions).empty?
      return win_combo
    end
  end
  return false
end

def full?(board)
  empty_spaces = 0
  board.each do |position|
    if position == " "
      empty_spaces += 1
    end
  end

  if empty_spaces > 0
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return
    false
  end
end

def winner(board)
  x_positions = []
  o_positions = []
  board.each_index do |position|
    if board[position] == "X"
      x_positions << position
    elsif board[position] == "O"
      o_positions << position
    end
  end
  WIN_COMBINATIONS.each do |win_combo|
    if (win_combo - x_positions).empty?
      return "X"
    elsif (win_combo - o_positions).empty?
      return "O"
    end
  end
  return nil
end
