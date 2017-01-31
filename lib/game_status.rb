# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    win_val1 = board[win_index_1]
    win_val2 = board[win_index_2]
    win_val3 = board[win_index_3]
    if win_val1 == win_val2 && win_val2 == win_val3 && position_taken?(board,win_index_1)
      return combo
    end
  end
  return false
end

def full?(board)
  board.detect{|val| val == " "} ? false : true
end

def draw?(board)
  won?(board) ? false :full?(board)
end

def over?(board)
  (won?(board) || draw?(board)) ? true : false
end

def winner(board)
  puts board
  won?(board) ? board[won?(board)[0]] : nil
end
