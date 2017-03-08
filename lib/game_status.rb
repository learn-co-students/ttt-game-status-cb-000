# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
  puts index
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top-left diagonal
  [6,4,2]  # Bottom-left diagonal
]


def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    nil
  else
    WIN_COMBINATIONS.select do |combination|
      if combination.all?{|position| board[position] == "X"} || combination.all?{|position| board[position] == "O"}
        return combination.to_a
      end
    end
    nil
  end
end


def full?(board)
  !(board.include?(" ") || board.include?(nil))
end


def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end


def over?(board)
  if draw?(board) || won?(board)
    true
  end
end


def winner(board)
  winning_combo = won?(board)
  if winning_combo
    board[winning_combo[0]]
  end
end
