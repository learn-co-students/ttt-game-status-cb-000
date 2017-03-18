# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
]

def won?(board)
chk = true
tmp = []
  while chk
    if board.all? {|i| i == " "}
      false
      chk = false
    else
      WIN_COMBINATIONS.each do |win|
        if win.all? {|m| board[m] == "X"} || win.all? {|n| board[n] == "O"}
          chk = false
          tmp = win
          return tmp
        elsif board.none? {|k| k == " "} || board.any? {|l| l == "X"}
          chk = false
          false
        end
      end
    end
  end
end

def full?(board)
  board.none? {|i| i == " "}
end

def draw?(board)
  if full?(board) && won?(board).class != Array
    true
  elsif !full?(board) && won?(board).class == Array
    false
  end
end

def over?(board)
  if draw?(board)
    true
  elsif won?(board)
    true
  else
    false
  end
end

def winner(board)
  if over?(board)
    win = won?(board)
    if win.class == Array && board[win[0]] == "X"
      "X"
    elsif win.class == Array && board[win[0]] == "O"
      "O"
    end
  elsif !over?(board) || full?(board)
    nil
    end
end

board0 = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
board1 = ["X", "O", "X", "X", "O", "X", "O", "X", "O"]
board2 = ["X", "X", "X", "O", "O", "X", "X", "O", "O"]
board3 = ["X", "O", "O", "O", "X", "O", "O", "X", "X"]
board4 = ["X", "X", "O", "O", "O", "X", "O", "X", "X"]
board5 = ["X", "O", "X", "X", "O", "O", "O", "O", "X"]
board6 = ["O", "O", "O", " ", "X", "X", " ", " ", "X"]
board7 = [" ", "X", "O", "O", "X", " ", " ", "X", "O"]

boards = [board0, board1, board2, board3, board4, board5, board6, board7]

boards.each do |brd|
  puts "----------------------------------------------------------------------"
  puts "----------------------------------------------------------------------"
  print "#{winner(brd)}\n"
end
