# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
[
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
  #Check for winning combos of 'X' or 'O' wins
  WIN_COMBINATIONS.each do |win_combo_arr|
    if ((board[win_combo_arr[0]] == "X") && (board[win_combo_arr[1]] == "X") && (board[win_combo_arr[2]] == "X"))
      return win_combo_arr
    elsif ((board[win_combo_arr[0]] == "O") && (board[win_combo_arr[1]] == "O") && (board[win_combo_arr[2]] == "O"))
      return win_combo_arr
    end
  end
  return false
end

def full?(board)
  board.all?{|mark| (mark =="X") || (mark == "O")}
end

def draw?(board)
  unless ((won?(board) == false) && (full?(board) == true))
    return false
  end
  return true
end

def over?(board)
  if ((won?(board) != false) || (draw?(board) == true) || (full?(board) == true))
    return true
  else
    return false
  end
end

def winner(board)
  confirmed_win = won?(board)
  if won?(board) != false || nil
    return board[confirmed_win[0]]
  end
end
