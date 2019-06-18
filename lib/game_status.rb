# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #diagonal1
  [2,4,6]  #diagonal2
]

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    position1 = board[win[0]]
    position2 = board[win[1]]
    position3 = board[win[2]]
    if position1 == position2 && position2 == position3 && position1 != " "
      return win
    else
      false
    end
  end
end

def full?(board)
  board.none?{|position| position == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  win_combo = won?(board)
  if won?(board)
    win_location = win_combo[0]
    board[win_location]
  end
end
