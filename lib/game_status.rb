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

def won?(board)
  tmp = nil;
  WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? {|ind| board[ind] == "X"} or win_combination.all?{|ind| board[ind] == "O"}
        tmp = win_combination
        break;
      else
        tmp = false
      end
    end
    return tmp;
end
def full?(board)
  board.all? do |element|
  if element == "X" or element == "O"
    true
  else
    false
    end
  end
end

def draw?(board)
  if full?(board) and !won?(board)
    true
  else
    false
  end

end

def over?(board)
  if won?(board) or draw?(board) or full?(board)
    true
  else false
  end
end

def winner(board)
  if won?(board).is_a? Array
   return board[won?(board).first]
  else
    return nil
  end

end
