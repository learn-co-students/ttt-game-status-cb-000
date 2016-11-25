# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0 ,1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6]
]

def won?(board)

  WIN_COMBINATIONS.each do |x|
      if x.all?{|y| board[y] == "X"}
        return x
      elsif x.all?{|y| board[y] == "O"}
        return x
      end
  end

  return false
end


def full?(board)

  board.each do |x|

    if  (x != "O") && (x != "X")
    return  false
    end
  end
    return true
  end

def draw?(board)

  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)

  if draw?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if (draw?(board) || !full?(board)) && !won?(board)
    return nil
  elsif (board[won?(board)[0]] == "X")
    return "X"
  else
    return "O"
  end
end
