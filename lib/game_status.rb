# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS =[
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
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? {|location| board[location] == "X" || win_combination.all? {|location| board[location] == "O"}}
    return win_combination
    end
  end

  if board.empty? == true
    return false
  end

  if board.all? {|spot| spot == "X" || spot == "O"}
    return false
  end

end

def winner(board)
  if draw?(board) == true || over?(board) == false
    return nil
  else
    letter = won?(board)[0]
    return board[letter]
end
end

def full?(board)
  board.each { |b| return false if b == " "}
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if (won?(board) || full?(board) || draw?(board))
    return true
  else
    return false
  end
end
