# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)

  # return false for an empty board
  # empty_board = true
  # counter = 0
  # board.each do |element|
  #  if position_taken?(board, counter)
  #     empty_board = false
  #  end
  #  puts "position taken #{position} #{empty_board}"
  #  counter += 1
  # end

  # if empty_board
  #   return false
  # end
  empty_board = board.all? do |element|
    element.nil? || element == " "
  end
  if empty_board
    return false
  end

  # For each win_combination in WIN_COMBINATIONS
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  WIN_COMBINATIONS.each do |win_combination|
    # grab each index from the win_combination that composes a win.
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    # puts "#{win_combination}"
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
       (position_1 == "O" && position_2 == "O" && position_3 == "O")
       return win_combination # return the win_combination indexes that won.
    else
       false
    end
  end

  return false

end

def full?(board)
  # Return true if every element in the board contains either an "X" or an "O"
  board.all? do |element|
    element == "X" || element == "O"
  end
  # full_board = true
  # counter = 0
  # board.each do |position|
  #  if !position_taken?(board, counter)
  #    full_board = false
  #  end
  #  puts "position taken #{position} #{full_board}"
  #  counter += 1
  # end
  # full_board
end

def over?(board)
  # Returns true if the board has been won, is a draw, or is full
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end


def draw?(board)
  # Returns true if the board has not been won and is full
  # and false if the board is not won and the board is not full,
  # and false if the board is won
  if won?(board) || !full?(board)
    false
  else
    true
  end
end

def winner(board)
  # Return the token, "X" or "O" that has won the game given a winning board
  if winning_combination = won?(board)
    board[winning_combination[0]]
  end
end
