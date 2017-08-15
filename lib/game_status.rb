# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top horizontal
  [3,4,5], #Middle horizontal
  [6,7,8], #Bottom horizontal
  [0,3,6], #Left vertical
  [1,4,7], #Middle vertical
  [2,5,8], #Right vertical
  [0,4,8], #Left corner diagonal
  [2,4,6] #Right corner diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |winning_array|
    if winning_array.all?{|index_num| board[index_num] == "X"}
      winning_array.inspect
    elsif winning_array.all?{|index_num| board[index_num] == "O"}
      winning_array.inspect
    end
  end
end

def full?(board)
  board.none?{|i| i == "" || i == " "}
end

def draw?(board)
  won?(board).nil? && full?(board) == true
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    winner = board[won?(board)[0]]
  end
end
