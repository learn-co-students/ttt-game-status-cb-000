# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end



# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

# ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

def won?(board)
  
    WIN_COMBINATIONS.each do |combination|
      
       same = (board[combination[0]] == board[combination[1]]) && (board[combination[1]] == board[combination[2]])
       
       win_status = position_taken?(board, combination[0]) && same

       if win_status
         return combination
       end
    end
    
    return nil
  
end

def full?(board)
  
    count = 0
  
    board.each_with_index do |pos, index|
      
      
      if (position_taken?(board, index))
          count += 1        
      end
      
      
    end

    return count == 9

end


def draw?(board)
  
  return full?(board) && !won?(board)
  
end

def over?(board)
  
  return draw?(board) || won?(board)
  
end

def winner(board)
  
  if !over?(board) || draw?(board)
    return nil
  else
    return board[won?(board)[0]]
      
  end
 
  
end  
  
  