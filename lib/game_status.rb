# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# defines a constant with arrays for each win combination
WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [3, 4, 5],
  [6, 7, 8],
]

#  returns an array of matching indexes for a win
def won?(board)
  WIN_COMBINATIONS.each do |win|
       if win.all?{|y| board[y] == "X"}
         return win
       elsif win.all?{|y| board[y] == "O"}
         return win
       end
     end
     return false # returns false for an empty board / a draw
   end

# returns true for a draw
# returns false for an in-progress game
   def full?(board)
     board.all? do |position|
       position == "X" || position == "O"
     end
   end

# returns true for a draw
# returns false for a game won or in-progress
def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  end
  return false
end

# returns true for a draw
# returns true for a won game
# returns false for an in-progress game
def over?(board)
  if full?(board) == true
    return true
  end
  return false
end

# returns X when X won, O when O won and nill when no winner
def winner(board)
  if (draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  elsif (board[won?(board)[0]] == "O")
    return "O"
  end
end
