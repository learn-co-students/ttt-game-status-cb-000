# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,4,8], #Left to Right diagonals
  [2,4,6], #Right to Left diagonals
  [0,3,6], #First columns
  [1,4,7], #Second columns
  [2,5,8] #Third columns
]
def won?(board)
  WIN_COMBINATIONS.find do |win_index|
     (board[win_index[0]] == "X" && board[win_index[1]] == "X" && board[win_index[2]] == "X") || (board[win_index[0]] == "O" && board[win_index[1]] == "O" && board[win_index[2]] == "O")
   end
 end

 def full?(board)
    !board.find { |position| (position == " " || position.nil?) }
  end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  else
    return nil
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  win = won?(board)
  if win
    return board[win[0]]
  end
end
