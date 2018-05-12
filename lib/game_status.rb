# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  o = WIN_COMBINATIONS.detect { |e| e.all? { |e| board[e] == "O"} }
  x = WIN_COMBINATIONS.detect { |e| e.all? { |e| board[e] == "X"} }
  if(x == nil && o == nil)
    return false
  end
  o == nil ? x : o
end



def full?(board)
  [0,1,2,3,4,5,6,7,8].all? { |e| position_taken?(board, e) }
end

def draw?(board)
  if (full?(board) && !won?(board))
    return true
  end
end

def over?(board)
  return full?(board) || won?(board) ? true : false
end

def winner(board)
  if(won?(board) == false)
    return nil
  end
  return board[won?(board)[0]] == "X" ? "X" : "O"
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
