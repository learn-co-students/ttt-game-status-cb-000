# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  won = false
  winning_combo = []
  #for each win_combination in WIN_COMBINATIONS
  WIN_COMBINATIONS.each do |win_combination|
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      won = true
      winning_combo = win_combination
    end
  end

  if (won)
    return winning_combo
  else
    return won
  end
end

def full?(board)
  all_empty = board.all? do |position|
    (position == "X" || position == "O")
  end

  return all_empty
end

def draw?(board)
  is_draw = true

  if won?(board)
    is_draw = false
  else
    if !(full?(board))
      is_draw = false
    end
  end

  return is_draw
end

def over?(board)
  if (won?(board) || draw?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if (won?(board))
    winning_combo = won?(board)
    return board[winning_combo[0]]
  else
    return nil
  end
end

draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
x_diagonal_won = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]
incomplete_board = ["X", " ", "X", " ", "X", " ", "O", "O", "X"]
