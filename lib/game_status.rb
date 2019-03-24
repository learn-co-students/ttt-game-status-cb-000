# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

#defines if there is a winning combination, draw, or if the board is empty
def won?(board)
empty_board = board.all? {|empty| empty == " "}
draw = board.all? {|token| token == "X" || token == "O"}
WIN_COMBINATIONS.any? do |win_combo|
  if win_combo.all? {|index| board[index] =="X" } || win_combo.all? {|index| board[index] =="O"}
     return win_combo
  else empty_board || draw
      false
    end
  end
end

#determines if the board is full
def full?(board)
  board.all? { |space| space == "X" || space == "O"}
end

#determines if there is a draw/nobody win
def draw?(board)
  if won?(board)
    return false
  elsif !won?(board) && full?(board)
    return true
  else
    return false
  end
end

#determines if the game is over by win, draw or full
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end


#determines who the winner is
def winner(board)
  index = []
  index = won?(board)
    if index == false
      return nil
    elsif
      board[index[0]] == "X"
        return "X"
    else
      return "O"
    end
end
