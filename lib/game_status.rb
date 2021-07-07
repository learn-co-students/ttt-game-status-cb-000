# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4 , 5], # Middle row
  [6, 7, 8], # Bottom row

  [0, 3, 6], # Straight down row 1
  [1, 4, 7], # Straight down row 2
  [2, 5, 8], # Straight down row 3

  [0, 4, 8], # Diagonal from top left
  [2, 4, 6] # Diagonal from top right
]

# Method for a win?

def won?(board)
  temp = false
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    if (board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X")
      temp = win_combination
    elsif (board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O")
      temp = win_combination
    end
  end
  temp
end

# Is the board full?
def full?(board)
  board.all? { |space| space == "X" || space == "O"  }
end

# Is there a draw?
def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

#Game over?
def over?(board)
  if full?(board) || draw?(board) || won?(board)
    true
  else
    false
  end
end

# Who is the winner?
def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end
