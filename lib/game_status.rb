# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2], 
    [3,4,5],
    [6,7,8], 
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    tiles_to_check = board.values_at(*combination)
    if tiles_to_check.all?{ |obj| obj == "X"}  || tiles_to_check.all?{ |obj| obj == "O"}
      return combination
    end
  end
  return nil
end

def full?(board)
  board.all? { |obj| obj == "X" || obj == "O" }
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  result = won?(board)
  if result
    board.values_at(*result)[0]
  else nil
  end
end
  