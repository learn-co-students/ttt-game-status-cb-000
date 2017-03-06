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

def won? board
  WIN_COMBINATIONS.each do |arr|
    print arr.inspect
    if(board[arr[0]] == "X" && board[arr[1]] == "X" && board[arr[2]] == "X") || (board[arr[0]] == "O" && board[arr[1]] == "O" && board[arr[2]] == "O")
      return arr
    end
  end
  return false
end

def full? board
  if !(won? board) && board.none?{|i|  i == " "}
    print "draw"
    return true
  else
    return false
  end
end

def draw? board
  if !(won? board) && board.none?{|i|  i == " "}
    return true
  else
    return false
  end
end

def over? board
  if(won? board)
    return true
  elsif(draw? board)
    return true
  else
    return false
  end
end

def winner board
  if (won? board)
    return board[(won? board)[0]]
  else
    return nil
  end
end
