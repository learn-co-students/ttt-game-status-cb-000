# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATION

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8,], [2,4,6], [0,3,6], [1,4,7], [2,5,8]]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|      # code will iterate each indexed value[] and return first instance in which the first index is equal to the value of "X" and store in the array win_combination else it will not return a value at all
    if (board[win_combination[0]]) == "X" && (board[win_combination[1]]) == "X" && (board[win_combination[2]]) == "X"
      return win_combination
    elsif  (board[win_combination[0]]) == "O" && (board[win_combination[1]]) =="O" && (board[win_combination[2]]) == "O"
    return win_combination
  end
  false
end
end

def full?(board)
  board.all?{|taken_space| taken_space != " "} 
end
  
def draw?(board)
  !(won?(board)) && (full?(board))
end

def over?(board)
  (won?(board)) || (draw?(board))
end

def winner(board)
  WIN_COMBINATIONS.detect do |win_combination|      # code will iterate each indexed value[] and return first instance in which the first index is equal to the value of "X" and store in the array win_combination else it will not return a value at all
    if (board[win_combination[0]]) == "X" && (board[win_combination[1]]) == "X" && (board[win_combination[2]]) == "X"
      return "X"
    elsif  (board[win_combination[0]]) == "O" && (board[win_combination[1]]) =="O" && (board[win_combination[2]]) == "O"
    return "O"
  else 
    nil
  end
end
end
  