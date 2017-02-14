# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #first col win
  [1,4,7], #second col win
  [2,5,8], #third col win
  [0,4,8], #diagonal win
  [2,4,6] #diagonal win
]

def won?(board)
  WIN_COMBINATIONS.each do |win|
   if [board[win[0]], board[win[1]], board[win[2]]] == ["X", "X", "X"] ||
      [board[win[0]], board[win[1]], board[win[2]]] == ["O", "O", "O"]
     return win
   end
  end
   return false
end

def full?(board)
  if won?(board) == false && board.all? {|element| element != " "}
    return true
  else
    false
  end
end

def draw?(board)
  if full?(board)
    true
  end
end
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win|
   if [board[win[0]], board[win[1]], board[win[2]]] == ["X", "X", "X"]
     return "X"
   elsif [board[win[0]], board[win[1]], board[win[2]]] == ["O", "O", "O"]
     return "O"
   end
  end
    return nil
end
