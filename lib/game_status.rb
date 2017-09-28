# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def turn_count(board)
  occupied = 0
  board.each do |x|
    if(x != " ")
      occupied += 1
    end
  end
  return occupied
end

def won?(board)
  winArray = []
  if(turn_count(board) == 0)
    return false
  end
  WIN_COMBINATIONS.each do |x|
    if(x.all?{|a| board[a] == "X"})
      return x.to_a
    elsif(x.all?{|a| board[a] == "O"})
      return x.to_a
    end
  end
  return false
end

def full?(board)
  if(turn_count(board) == 9)
    return true
  else return false
  end
end

def draw?(board)
  if(full?(board) && !won?(board))
    return true
  else return false
  end
end

def over?(board)
  if(draw?(board) || won?(board))
    return true
  else return false
  end
end

def winner(board)
  if(won?(board) != false)
    winArray = won?(board)
    return board[winArray[0]]
  else return nil
  end
end
