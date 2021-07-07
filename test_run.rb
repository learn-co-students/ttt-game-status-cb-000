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
  [2,4,6]
]

board = ["X", "O", "X", "O", "X", "O", " ", " ", " "]


well = board.include?(" ")


# winner = []
# WIN_COMBINATIONS.each do |combination|
#   puts "This is the combination #{combination}"
#   #check if they are all the 'X' or all 'O'
#   if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
#     puts "The winning combination #{combination} IS 'X'"
#     winner.push(combination)
#   end
#   if board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
#     puts "The winning combination #{combination} IS 'O'"
#     winner.push(combination)
#   end
# end
# puts winner
