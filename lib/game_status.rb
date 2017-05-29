require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# WIN_COMBINATIONS
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
  WIN_COMBINATIONS.any? do |win_combination|
    return_array = []
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_index_1 = board[win_index_1]
    position_index_2 = board[win_index_2]
    position_index_3 = board[win_index_3]

    if (position_index_1 == "X" && position_index_2 == "X" && position_index_3 == "X")
      return_array = [win_index_1, win_index_2, win_index_3]
      return return_array
    elsif (position_index_1 == "O" && position_index_2 == "O" && position_index_3 == "O")
      return_array = [win_index_1, win_index_2, win_index_3]
      return return_array
    else
      false
    end
  end
end

def full?(board)
  board.all? { |x| x == "X" || x == "O" }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  win_indexes = won?(board)
  win_indexes ? board[win_indexes[0]] : nil
end
