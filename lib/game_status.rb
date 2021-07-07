# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]


def won?(board)
  WIN_COMBINATIONS.detect do |win|
    if win.all?{|index_num| board[index_num] == "X"}
      win.inspect
    elsif win.all?{|index_num| board[index_num] == "O"}
      win.inspect
    end
  end
end

def full?(board)
  board.none? {|space| space == " " || space == nil}
end

def draw?(board)
  won?(board).nil? && full?(board)
end

def over?(board)
  #Game is over if the game is won OR if the game is a draw
  #Returns False is game is not full and is not won or a draw
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if (over?(board) && won?(board))
    #Returns the value of array "Board" where win condition was met
    return board[won?(board)[0]]
  end
end
