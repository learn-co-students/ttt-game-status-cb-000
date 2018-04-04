# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6],
[0,3,6], [1,4,7], [2,5,8]]

def won?(board)
   match = board.size.times.select{|i| board[i] == "X"}
   match2 = board.size.times.select{|i| board[i] == "O"}

   if !board.include?("X") && !board.include?("O")
     return nil
   end

   WIN_COMBINATIONS.each do |combo|
     if match & combo == combo || match2 & combo == combo
       return combo
     end
   end

   return false
end

def full?(board)
  if(board.size.times.select{|i| board[i] == "X" ||board[i] == "O" }.size == 9)
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  else
    return false
  end
end
match = [0,2,4,8]

def winner(board)
  if won?(board) == false
    return nil
  end
  return board[won?(board)[0]]
end

board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
