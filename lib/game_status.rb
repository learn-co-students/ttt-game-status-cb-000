# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],  #top_row_win
  [3, 4, 5],   #middle_row_win
  [6, 7, 8],   #botton_row_win
  [0, 3, 6],   #left_column_win
  [1, 4, 7],   #middle_column_win
  [2, 5, 8],   #right_column_win
  [6, 4, 2],   #diagonal_win1
  [0, 4, 8],   #diagonal_win2
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_1 != " "
      return combo
    else false
    end
  end
  false
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if over?(board)
    if !draw?(board)
      winning_array = won?(board)
      board[winning_array[0]]
    end
  end
end
