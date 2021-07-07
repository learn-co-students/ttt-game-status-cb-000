# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  # ETC, an array for each win combination
]
def won?(board)
  count=0
  if WIN_COMBINATIONS.each do |index|
  win_one = index[0]
  win_two = index[1]
  win_three = index[2]
  place_1 = board[win_one]
  place_2 = board[win_two]
  place_3 = board[win_three]
  if place_1 == "X" && place_2 == "X" && place_3 == "X"
    count+=1
    return index
  elsif place_1 == "O" && place_2 == "O" && place_3 == "O"
    count+=1
    return index
  end
end
  if count=0
    return false
end
end
end

def full?(board)
  i=0
  board.each do |index|
    if index == "X" || index == "O"
    i+=1
    end
  end
    if i==9
      return true
    else
      return false
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
     return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
  won?(board).each do |i|
    if board[i] == "X"
      return "X"
  else
    return "O"
 end
 end
else
    return nil
  end
end
