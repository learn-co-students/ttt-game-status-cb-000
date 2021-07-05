# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
winner = ""
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal left right
  [2,4,6]  #diagonal right left
]

def won?(board)
  if board.all? { |i| i == "" || i == " "} == true
    return false
  end
  
  WIN_COMBINATIONS.detect do |win_cond|
    board[win_cond[0]] == board[win_cond[1]]&&
    board[win_cond[0]] == board[win_cond[2]]&&
    position_taken?(board, win_cond[0])
  end
end

def full?(board)
  if board.detect{|i| i == "" || i == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board) == false || won?(board) == nil && full?(board) == true
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false && won?(board) != nil || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false && won?(board) != nil
    win = won?(board)
    return board[win[0]]
  else
    return nil
  end
end