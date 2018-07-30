# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                   [0, 1, 2],
                   [3, 4, 5],
                   [6, 7, 8],
                   [0, 4, 8],
                   [2, 4, 6],
                   [0, 3, 6],
                   [1, 4, 7],
                   [2, 5, 8]
                   ]

 # def won?(board)
 #  if board.include?("X") || board.include?("O")
 #     WIN_COMBINATIONS.select do |win|
 #       if board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X"
 #         return win
 #       elsif board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O"
 #         return win
 #       end
 #     end
 #   elsif !(board.include?(" "))
 #     return false
 #   end
 # end
def won?(board)
  WIN_COMBINATIONS.each do |wincombo|
    if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X"
      return wincombo
    elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O"
       return wincombo
     end
   end
   false
 end


def full?(board)
  if !(board.include?(" "))
    return true
  else
    return false
  end
end

def draw?(board)
  if won?(board)
    false
  elsif won?(board) == false && full?(board) == true
    return true
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
  if won?(board)
    win = won?(board)[0]
    board[win]
  end
end

#
#
# if won?(board) == false && full?(board) == true
#   return true
# elsif won?(board) == false && full?(board) == false
#   false
# elsif won?(board)
#   false
# end
