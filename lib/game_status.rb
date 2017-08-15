# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
#across
[0,1,2], #top-across
[3,4,5], #middle-across
[6,7,8], #bottom-across
#down
[0,3,6], #left-down
[1,4,7], #middle-down
[2,5,8], #right-down
#diagonal
[0,4,8], #right-diag
[6,4,2]  #left-diag
]

def won?(board)
WIN_COMBINATIONS.each do |winner|
win_index_1 = winner[0]
win_index_2 = winner[1]
win_index_3 = winner[2]

position_1 = board[win_index_1]
position_2 = board[win_index_2]
position_3 = board[win_index_3]

winnerX = position_1 == "X" && position_2 == "X" && position_3 == "X"
winnerO = position_1 == "O" && position_2 == "O" && position_3 == "O"

return winner if winnerX || winnerO == true
end
if board.empty? == true
  return false
end
end

def full?(board)
!board.any?{|space| space == " "}
end

def draw?(board)
full?(board) && !won?(board)
end

def over?(board)
won?(board) || draw?(board) || full?(board)
end

def winner(board)
  board[won?(board).first] if won?(board)
end
