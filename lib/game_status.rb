# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [2,5,8],
  [1,4,7],
  [0,3,6],
  [2,4,6],
  [0,4,8]
]

def won?(board)
  WIN_COMBINATIONS.find do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    position_taken?(board, win_index_1) && position_1 == position_2 && position_2 == position_3
  end
end

def full?(board)
  board.none?{|x| x == " " || x.nil?}
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  draw?(board) || won?(board) ? true : false
end

def winner(board)
  if over?(board)
    board[won?(board)[0]]
  end
end
