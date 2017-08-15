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
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.each do |index|
    win_combination = []
    index.each do |win_index|
      win_combination.push(board[win_index])
      if (win_combination == ["X","X","X"]) || (win_combination == ["O","O","O"])
        return index
      end
    end
  end
  return false
end

def full?(board)
  !(board.include?(" "))
end

def draw?(board)
  if !(won?(board)) && full?(board)
    return true
  elsif won?(board) || full?(board)
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  index = won?(board)
  if index != false
    if board[index[0]] == "X"
      return "X"
    elsif board[index[0]] == "O"
      return "O"
    end
  else
    return nil
  end
end
