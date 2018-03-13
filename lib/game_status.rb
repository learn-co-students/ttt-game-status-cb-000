# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  row = Array.new
  return false if board.none?{|i| i == "X" || i == "O"}

  WIN_COMBINATIONS.each do |combo|
    return combo if combo.all?{|index| position_taken?(board, index) && board[index] == "X"}
    return combo if combo.all?{|index| position_taken?(board, index) && board[index] == "O"}
  end
  return false
end

def full?(board)
  board.none?{|i| i == "" || i == " " || i == nil}
end

def draw?(board)
  !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  winning = won?(board)
  if winning.is_a?(Array)
    return board[winning[0]]
  else
    return nil
  end
end
