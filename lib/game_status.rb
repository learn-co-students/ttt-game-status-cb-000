# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #First column
  [1,4,7], #Second column
  [2,5,8], #Third column
  [0,4,8], #First diagonal
  [2,4,6], #Second diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

    check_board = [board[win_combination[0]], board[win_combination[1]], board[win_combination[2]]]
    if
      check_board.all? do |check| 
        check == "X"
      end
      return win_combination
    elsif 
      check_board.all? do |check| 
        check == "O"
      end
      return win_combination
    end
  end 
  return false
end

def full?(board)
  board.all? do |position|
    !(position == " ")
  end
end

def draw?(board)
  if
    won?(board) == false && full?(board) == true
    return true
  else 
    return false
  end
end

def over?(board)
  if 
    won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  else
    return false 
  end 
end

def winner(board)
  check = won?(board)
  if check == false
    return nil
  elsif [board[check[0]], board[check[1]], board[check[2]]].include?("X") 
    return "X"
  elsif [board[check[0]], board[check[1]], board[check[2]]].include?("O")
    return "O"
  end
end
