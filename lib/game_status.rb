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
  WIN_COMBINATIONS.find do |winning_move|
    board[winning_move[0]] == board[winning_move[1]] && board[winning_move[1]] == board[winning_move[2]] && position_taken?(board, winning_move[1])
end
end

def full?(board)
board.none? do |taken|
  taken == " " || taken.nil?
end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
if won?(board) != nil
  winner = board[won?(board)[0]]
end
end
