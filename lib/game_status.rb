# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

def won?(board)
  # check if board is empty and return false if so
  if board.all?{|i| i == " "}
    return false
  end

  WIN_COMBINATIONS.each do |win_combination|
    if check_for_win(board, win_combination)
      return win_combination
    end
  end

  if full?(board)
    false
  end

end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  end
end

def winner(board)
  if !won?(board)
    return nil
  else
    winning_comb = won?(board)
    winner_symbol = board[winning_comb[0]]
    return winner_symbol
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !won?(board) && !full?(board)
    false
  elsif won?(board)
    false
  end
end

def full?(board)
  if board.all?{|i| i != " "}
    return true
  end
end

def check_for_win(board, win_combination)
  position_1 = board[win_combination[0]]
  position_2 = board[win_combination[1]]
  position_3 = board[win_combination[2]]
  win = false

  if position_taken?(board,win_combination[0]) && position_taken?(board,win_combination[1]) && position_taken?(board,win_combination[2])
    if position_1 == position_2 && position_1 == position_3 && position_2 == position_3
      win = true
    end
  end
  win
end
