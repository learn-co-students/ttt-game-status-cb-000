require "pry"
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], # horizontal rows
  [0,3,6], [1,4,7], [2,5,8], # vertical rows
  [0,4,8], [2,4,6]] # diagonol rows

def won?(board)
  winning_array = nil
  WIN_COMBINATIONS.each do |win_combo|
    pos_1 = board[win_combo[0]]
    pos_2 = board[win_combo[1]]
    pos_3 = board[win_combo[2]]

    return win_combo if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
    return win_combo if pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
  end
  false
end

def full?(board)
  full = true
  board.each do |pos|
    if pos != "X" &&  pos != "O"
      full = false
    end
  end
  full
end

def draw?(board)
  if won?(board) == false && full?(board)
    true
  else
    false
  end  
end

def over?(board)
  return true if won?(board) || full?(board) || draw?(board)
  false 
end

def winner(board)
  return nil if won?(board) == false
  winning_combo = won?(board)
  winning_combo.each do |ind|
    if board[ind] == 'X'
      return 'X'
    elsif board[ind] == 'O'
      return 'O'
    end
  end
end




