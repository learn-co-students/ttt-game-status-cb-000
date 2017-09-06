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
  #if (board.all? { |cell| cell == " "}) then
 #   return false
#  else
#    #board.
#  end

  WIN_COMBINATIONS.each { |combination|
    id0 = combination[0]
    id1 = combination[1]
    id2 = combination[2]

    if (board[id0] == "X" && board[id1] == "X" && board[id2] == "X")
      return combination
    elsif (board[id0] == "O" && board[id1] == "O" && board[id2] == "O")
      return combination
    end
  }

  return false

end

def full?(board)
  if draw?(board) then
    return true
  else
    return false
  end
end

def draw?(board)
  if board.all? {|cell| cell != " "} && won?(board) == false then
    return true
  end

  return false
end

def over?(board)
  if draw?(board) then return true end
  if won?(board) then return true end
  if full?(board) then return true end
  return false
end

def winner(board)

    WIN_COMBINATIONS.each { |combination|
      id0 = combination[0]
      id1 = combination[1]
      id2 = combination[2]

      if (board[id0] == "X" && board[id1] == "X" && board[id2] == "X")
        return "X"
      elsif (board[id0] == "O" && board[id1] == "O" && board[id2] == "O")
        return "O"
      end
    }

    return nil
end
