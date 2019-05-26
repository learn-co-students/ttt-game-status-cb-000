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
  WIN_COMBINATIONS.each do |com|
    win_index_1 = com[0] #3
    win_index_2 = com[1] #4
    win_index_3 = com[2] #5

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return com
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return com
    end
  end
  return false
end

def full?(board)
  board.none? { |f| f == " " }
end

def draw?(board)
  if full?(board)
    if !won?(board)
      return true
    end
  end
    return false
end

def over?(board)
  if full?(board) || draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner (board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
