$x = " "
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #horizontal
  [0,1,2], #top
  [3,4,5], #middle
  [6,7,8], #bottom
  #vertical
  [0,3,6], #left
  [1,4,7], #middle
  [2,5,8], #bottom
  #diagonal
  [0,4,8], #fromleft
  [6,4,2] #fromright
]

def won?(board)
  x_win = false
  o_win = false
  x_win_array = 0
  o_win_array = 0
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]


    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      x_win = true
      x_win_array = win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      o_win = true
      o_win_array = win_combination
    elsif position_1 == " " && position_2 == " " && position_3 == " "
      empty = true
    end
  end
if x_win == false && o_win == false
  $x = nil
  return false
elsif x_win == true
  $x = "X"
  return x_win_array
elsif o_win == true
  $x = "O"
  return o_win_array
else empty == true
  return false

end
end

def full?(board)
  board.all? do |index|
    index.include?("X") || index.include?("O")
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  elsif won?(board) == true
    return false
  end
end

def over?(board)
  if won?(board) == true || draw?(board) == true || full?(board) == true
    return true
  end
end

def winner(board)
  won?(board)
  if $x == "X"
    return $x
  elsif $x == "O"
    return $x
  elsif $x == nil
    return nil
  end
end
