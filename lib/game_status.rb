# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Last row
  [0,4,8], # First Diagnoal
  [2,4,6], # Second Diagnoal
  [0,3,6], # First Column
  [1,4,7], # Second Column
  [2,5,8] # Third Column
]

def won?(board)
  checked_board = board.reject { |element| [' '].include? element } # make a blank array if empty board
  if checked_board.empty?
    return false
  end

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination # return the win_combination indexes that won.
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination # return the win_combination indexes that won.
    end
  end
  return false
end

def full?(board)
  checked_board = board.reject { |element| ['X', 'O'].include? element }
  true if checked_board.empty?
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif won?(board)
    false
  else
    false
  end
end

def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  elsif !full?(board)
    false
  end
end

def winner(board)
  if !won?(board)
    nil
  elsif board[won?(board)[0]] == 'X'
    "X"
  elsif board[won?(board)[0]] == 'O'
    "O"
  end
end
