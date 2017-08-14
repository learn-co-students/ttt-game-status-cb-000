
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row

  [0,3,6], # Left col
  [1,4,7], # Middle col
  [2,5,8], # Right col

  [0,4,8], # Left top corner row
  [2,4,6], # Right top corner row
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board,combo[0]) && position_taken?(board,combo[1]) && position_taken?(board,combo[2])
      if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
        return combo
      end
    end #if
  end #WIN_COMBINATIONS
  return nil
end

def draw?(board)
  if won?(board)
    return false
  else
    return true
  end
end

def full?(board)
     board.each{|i|
      if (i == nil || " " == i)
        return false
    end
       }
end

def over?(board)
  if full?(board) || won?(board)
    return true
  else
    return false
  end
end

def winner(board)
 if won?(board) == board.each_index.select{|i| board[i] == 'O'}
   return "O"
 elsif won?(board) == board.each_index.select{|i| board[i] == 'X'}
   return "X"
    else nil
  end
end
