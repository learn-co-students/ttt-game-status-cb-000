# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS =[
    [0, 1, 2],  # Top row
    [3, 4, 5],  # Middle row
    [6, 7, 8],  # Bottom
    [0, 3, 6],  # left column
    [1, 4, 7],  # Middle column
    [2, 5, 8],   # Right column
    [0, 4, 8],  #backslash
    [2, 4, 6]   #forward_slash
]

def won?(board)
    WIN_COMBINATIONS.detect do |combo|
        win_index_1 = combo[0]
        win_index_2 = combo[1]
        win_index_3 = combo[2]

      if
        (board[win_index_1] == "X"  && board[win_index_2] == "X"  && board[win_index_3] == "X") ||
        (board[win_index_1] == "O"  && board[win_index_2] == "O"  && board[win_index_3] == "O")

        return combo
      end
    end
end

def full?(board)
  !board.detect{|i| i == " "}
end

def draw?(board)
  if
    full?(board) && !won?(board)
    true
  elsif
    full?(board) && won?(board)
    false
  else
    !won?(board)
    false
  end
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if over?(board)
    winner = won?(board)[0]
    board[winner]
  end
end
