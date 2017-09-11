# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "")
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
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]
    if position_taken?(board, win_index_1) && position_taken?(board, win_index_2) && position_taken?(board, win_index_3)
      if board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3]
        return combination
      end
    end
  end
  false
end

def full?(board)
  board.each do |space|
    board.index(space)
    if !position_taken?(board,board.index(space))
      return false
    end
  end
  true
end

def draw?(board)
  if full?(board)
    if won?(board)
      return false
    else
      return true
    end
  end
  false
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    winning_set = won?(board)
    if board[winning_set[0]] == "X"
      "X"
    elsif board[winning_set[0]] == "O"
      "O"
    end
  end
end

x = ["X", "X", "", "O", "O", "O", "", "", ""]
puts won?(x)
