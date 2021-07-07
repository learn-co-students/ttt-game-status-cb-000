# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
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
  match_array = []
  WIN_COMBINATIONS.each do |index|
    if (board[index[0]] == "X" && board[index[1]] == "X" && board[index[2]] == "X") || (board[index[0]] == "O" && board[index[1]] == "O" && board[index[2]] == "O")
      index.each do |a|
        match_array << a
      end
    end
  end
  if match_array.empty? == true || match_array.nil? == true
    false
  else
    return match_array
  end
end

def full?(board)
  board.all? do |i|
    i == "X" || i == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
   win = nil
   WIN_COMBINATIONS.each do |index|
     if (board[index[0]] == "X" && board[index[1]] == "X" && board[index[2]] == "X")
       win = "X"
     elsif (board[index[0]] == "O" && board[index[1]] == "O" && board[index[2]] == "O")
       win = "O"
     end
   end
   return win
end
