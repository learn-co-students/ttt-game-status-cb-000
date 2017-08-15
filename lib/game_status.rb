# Helper Method - provided
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
[0,4,8], #left diagonal
[2,4,6]] #right diagonal

def won?(board)
  WIN_COMBINATIONS.each do |winning_combo|
    if (board[winning_combo[0]] == "X" && board[winning_combo[1]] == "X" && board[winning_combo[2]] == "X") ||
      (board[winning_combo[0]]== "O" && board[winning_combo[1]] == "O" && board[winning_combo[2]] == "O")
      return winning_combo
    end
  end
  return false
end

def full?(board)
  if board.include?(" ")
    return false
  end
    return true
  end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
    return false
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  end
    return false
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo == false
    return nil
  elsif board[winning_combo[0]] == "X"
    return "X"
  elsif board[winning_combo[0]] == "O"
    return "O"
end
end
