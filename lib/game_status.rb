# Helper Method

 board = [ " ", " ", "O", "O", " ", "O", "X", "X", "X" ]
 
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 4, 8], 
  [6, 4, 2], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8]
  ]
  

def won?(board)
 WIN_COMBINATIONS.each do |win_combo|

  win_index_1 =  board[win_combo[0]]
  win_index_2 =  board[win_combo[1]]
  win_index_3 =  board[win_combo[2]]
  
  if win_index_1 == "X" && win_index_2 == "X" && win_index_3 == "X" || win_index_1 == "O" && win_index_2 == "O" && win_index_3 == "O" 
  return win_combo
  end
 end
  return false
end

def full?(board)
  board.each do |index|
    if index == " " || index == nil
      return false
    end
  end
      return true 
end   

def draw?(board)
      if !(won?(board)) && full?(board)
        return true
      elsif !(won?(board)) && !full?(board) || won?(board)
        return false
      #elsif won?(board)
        #return false
      end 
    #end     
end   

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true 
  else
    false   
  end  
end 

def winner(board)
  win_combo = won?(board)
  
  if !win_combo
    return nil
  elsif board[win_combo[0]] == "X" 
    return "X"
  elsif board[win_combo[0]] == "O"
    return "O"
  end
end   