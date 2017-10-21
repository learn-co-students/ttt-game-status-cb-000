# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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

def won?(board)
  if !board.any?{|i| i != " "}
    return false
  else
    WIN_COMBINATIONS.each do |combination|
      combination
      win_index1 = combination[0]
      win_index2 = combination[1]
      win_index3 = combination[2]

      position1 = board[win_index1]
      position2 = board[win_index2]
      position3 = board[win_index3]

      if (position1 == "X" && position2 == "X" && position3 == "X") ||
         (position1 == "O" && position2 == "O" && position3 == "O")
        return combination
      end
    end
  end
  return false
end

def full?(board)
  return board.include?(" ")? false : true
end

def draw?(board)
  if won?(board) == false && full?(board)
    return true
  elsif won?(board) == false && full?(board)
    return false
  elsif won?(board) != false
    return false
  end
end

def over?(board)
  return (won?(board) || draw?(board) || full?(board))? true : false
end

def winner?(board)
  if combination = won?(board)
    board[combination.first]
  end
end
# def winner?(board)
#   if won?(board)
#     winning_combination = won?(board)
#     player = board[winning_combination[0]]
#     return player
#   else
#     return nil
#   end
# end
