# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && board[combo[0]] != " "
  end
end

def empty?(board)
  board.all? {|token| token == " "}
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
    draw?(board) || won?(board)
end

def winner(board)
  status = won?(board)
  if status.nil?
    nil
  else
    board[status[0]]
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,4,8], #Diagonal Right
  [0,1,2], #Top Row
  [3,4,5], #Middle Row
  [6,7,8], #Bottom Row
  [2,4,6], #Diagonal Left
  [0,3,6], #Left Column
  [1,4,7], #Right Column
  [2,5,8] #Left Column
]
