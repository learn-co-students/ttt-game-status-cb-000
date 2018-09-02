# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
  win_in_0 = combo[0]
  win_in_1 = combo[1]
  win_in_2 = combo[2]

  position_1 = board[win_in_0] # load the value of the board at win_index_1
  position_2 = board[win_in_1] # load the value of the board at win_index_2
  position_3 = board[win_in_2]

  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return combo
   end
  end

  return false
 end

 def full?(board)
   board.all? { |item| item != " "}
 end

 def draw?(board)
   if full?(board) && !won?(board)
     return true
   elsif !won?(board) && !full?(board) || won?(board)
     return false
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
   if won?(board) && board[won?(board)[0]] == "O"
   "O"
   elsif won?(board) && board[won?(board)[0]] == "X"
   "X"
  end
end
