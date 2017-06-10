# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top horiz
  [3, 4, 5], #middle horiz
  [6, 7, 8], #bottom horiz
  [0, 3, 6], #left vert
  [1, 4, 7], #middle vert
  [2, 5, 8], #right vert
  [0, 4, 8], #l-r diag
  [2, 4, 6] #r-l diag
]

# (condition[0] == "O" && condition[1]=="O" && condition[2]=="O")

def won?(board)
  WIN_COMBINATIONS.each do |condition|
     if condition.all?{|position| position_taken?(board, position) == true}
       if (board[condition[0]] == "X" && board[condition[1]]=="X" && board[condition[2]]=="X")
         return condition
       elsif (board[condition[0]] == "O" && board[condition[1]]=="O" && board[condition[2]]=="O")
         return condition
       end
     end
  end
  false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  end
end

def over?(board)
  if won?(board) != false || full?(board) == true
    true
  end
end

def winner(board)
  if over?(board) == true && draw?(board) != true
    player = board[won?(board)[0]]
  end
end
