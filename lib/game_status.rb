# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.each{|winning_combo| 
    
    index_0 = winning_combo[0]
    index_1 = winning_combo[1]
    index_2 = winning_combo[2]
    
    first_position = board[index_0]
    second_position= board[index_1]
    third_position=board[index_2]

    if first_position=="X"&& second_position=="X"&&third_position=="X"
        return winning_combo
    elsif first_position=="O"&& second_position=="O"&&third_position=="O"
        return winning_combo
    
      end
      }
      return false
end 

def full?(board)
  board.all?{|index| index=="X"|| index=="O"}
    end
    
def draw?(board)
  !won?(board) && full?(board)
    
  end 
  
def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
   
    won?(board).each do |index|
      winning_letter = board[index]
      return winning_letter
    
    end
  end
end 
  



