# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Forward diagonal
  [2,4,6] #Backward diagonal
]


def won?(board)
  WIN_COMBINATIONS.find do |combo|
    position_taken?(board, combo[1]) &&
    board[combo[0]] == board[combo[1]] &&
    board[combo[0]] == board[combo[2]]
   end
end


def full?(board)
   board.all? { |space| space == "X" || space == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
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
  if !won?(board)
    return nil
  elsif board[won?(board)[0]] == "X"
    return "X"
  else board[won?(board)[0]] == "O"
    return "O"
  end
end
