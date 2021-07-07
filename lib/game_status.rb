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
  winner = []
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      combination.each do |position|
        winner << position
      end
    end
    if board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      combination.each do |position|
        winner << position
      end
    end
  end
  unless winner.empty?
    return winner
  end
end

def full?(board)
 !(board.include?(" ") || board.include?(""))
end

def draw?(board)
  (!won?(board) && full?(board))
end

def over?(board)
  (draw?(board) || won?(board))
end

def winner(board)
  combination = won?(board)
  if !combination.nil?
    return board[combination[0]]
  end
  combination
end
