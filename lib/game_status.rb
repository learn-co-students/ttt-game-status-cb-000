# Helper Method
def position_taken?(board, index)
  # return false if the space is empty
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # 1st column
  [1,4,7], # 2nd column
  [2,5,8], # 3rd column
  [0,4,8], # 1st diagonal
  [2,4,6] # 2nd diagonal
]

# win method to check if a player won
def won? board
  WIN_COMBINATIONS.each do |win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" ||
       board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return win_combination
    end
  end
  return nil
end

def full? board
  !board.include?(" ")
end

def draw? board
 full?(board) && !(won?(board))
end

def over? board
  won?(board) || full?(board) || draw?(board)
end

def winner board
  board[won?(board)[0]] if won?(board)
end
