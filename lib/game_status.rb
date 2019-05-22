# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

#board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      win_x = true
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      win_o = true
    else
      win_x = false
      win_o = false
    end
    if win_x == true || win_o == true
      return win_combination
    end
  end
  board.each do |index|
    if index != "X" || index != "O"
      return false
    end
  end
end




def full?(board)
  i = 0
  while i <= board.length
    if board[i] == " "
      return false
    else
      i += 1
      if i == board.length
        return true
      end
    end
  end
end




def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end


def winner(board)
  if draw?(board)
    return nil
  elsif won?(board)
    win = won?(board)
    return board[win[0]]
  end
end
