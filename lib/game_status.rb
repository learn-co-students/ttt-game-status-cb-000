# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #first column
  [1, 4, 7], #middle column
  [2, 5, 8], #last column
  [0, 4, 8], #diagonal 1
  [2, 4, 6], #diagonal 2
]

def won?(board)
  WIN_COMBINATIONS.detect do |winner|
    if board[winner[0]] == board[winner[1]] && board[winner[1]] == board[winner[2]] && position_taken?(board, winner[0])
      true
    else
      false
    end
  end
end

def full?(board)
  board.all? do |token|
    token == "X" || token == "O"
  end
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  draw?(board) || full?(board) || won?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
