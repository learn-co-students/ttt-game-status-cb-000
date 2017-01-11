# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == ' ')
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
  [6, 4, 2]
].freeze

def won?(board)
  winner = false
  for win in WIN_COMBINATIONS
    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]

    pos_1 = board[win_index_1]
    pos_2 = board[win_index_2]
    pos_3 = board[win_index_3]

    if (pos_1 == 'X' && pos_2 == 'X' && pos_3 == 'X') || (pos_1 == 'O' && pos_2 == 'O' && pos_3 == 'O')
      return win
    else
      false
    end
  end
  winner
end

########################################################

def full?(board)
  board.all? do |place|
    true if place == 'X' || place == 'O'
  end
end

########################################################

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

#########################################################

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

#########################################################

def winner(board)
  last1 = won?(board)
  if last1
	board[last1[-1]]
  end
end
