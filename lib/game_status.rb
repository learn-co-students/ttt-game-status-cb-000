# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # botton row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # left diag
  [2,4,6], # right diag
]

# Define if there is a win on the board
def won?(board)
  WIN_COMBINATIONS.detect do |win|
    if (board[win[0]]) == "X" && (board[win[1]]) == "X" && (board[win[2]]) == "X"
      return win
    elsif (board[win[0]]) == "O" && (board[win[1]]) == "O" && (board[win[2]]) == "O"
      return win
    end
  end
end

# Define if the board is full
def full?(board)
   board.none?{ |space| space == " "}
end

#Define a draw
def draw?(board)
  (won?(board))== nil && (full?(board))== true
end

#Define if the game is over if the board has been won, is a draw, or is full
def over?(board)
  draw?(board) || full?(board) || won?(board)
end

#Define the winner!
def winner(board)
  WIN_COMBINATIONS.detect do |win|
    if (board[win[0]]) == "X" && (board[win[1]]) == "X" && (board[win[2]]) == "X"
      return "X"
    elsif (board[win[0]]) == "O" && (board[win[1]]) == "O" && (board[win[2]]) == "O"
      return "O"
    end
  end
end
