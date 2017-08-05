# # Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
#


# # Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8], #bottom row win
  [0,3,6],
  [1,4,7],
  [2,5,8], #right column win
  [0,4,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
    if position_taken?(board, win_combo[0])
      board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]]
    end

  end
end
#
#
 def full?(board)
  board.all? { |position| position == "X" || position == "O" }
end

def draw?(board)
  if !won?(board)
    if full?(board)
      true
    else
      false
    end
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  if won?(board) != nil
    winner = board[won?(board)[0]]
  end
end
