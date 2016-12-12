# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]

def won?(board)
  if board.include?("X") == false && board.include?("O") == false
    return false
  else
    WIN_COMBINATIONS.each do |combo|
      if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
        return combo
      elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
        return combo
      end
    end
    return false
  end
end

def full?(board)
  (board.include?(" ") || board.include?("")) == false
end

def draw?(board)
  if full?(board) == true
    if won?(board) == false
      return true
    elsif won?(board) == false
      return false
    end
  else
    #pass
    puts "The game is not over"
  end
end

def over?(board)
  if full?(board) == true
    return true
  end
end

def winner(board)
  if won?(board) != false
    if board[won?(board)[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    #pass
  end
end
