# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 3, 6],
  [0, 4, 8],
  [3, 4, 5],
  [6, 7, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6]
]

def won?(board)
 WIN_COMBINATIONS.each do |win_combination|
    win_index1 = win_combination[0]
    win_index2 = win_combination[1]
    win_index3 = win_combination[2]

    player_at_position1 = board[win_index1]
    player_at_position2 = board[win_index2]
    player_at_position3 = board[win_index3]

    if (player_at_position1 == "X" && player_at_position2 == "X" && player_at_position3 == "X") || (player_at_position1 == "O" && player_at_position2 == "O" && player_at_position3 == "O")
       return win_combination
     end
  end
  return false
end

def full?(board)
  board.all? do |position|
    position != " "
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif (!won?(board) && !full?(board)) || (won?(board))
    false
  end
end

def over?(board)
 return true if won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if over?(board)
    win_combination = won?(board)
    win_index = win_combination[0]
    winning_player = board[win_index]
  else
    nil
  end
end
