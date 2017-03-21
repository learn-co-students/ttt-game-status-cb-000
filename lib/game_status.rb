# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,4,8],
  [2,4,6],
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
]

def won?(board)
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.

  game_won = WIN_COMBINATIONS.any? do |win_combination|
      win_x = win_combination.all? do |i|
        board[i] == "X"
      end

      win_o = win_combination.all? do |i|
        board[i] == "O"
      end

      if win_x || win_o
        return win_combination
      end
  end

  return game_won

end


def full?(board)
#accept a board and return true if every element in the board contains either an "X" or an "O"

    board.all? do |position|
        position == "X" || position == "O"
    end

end

def draw?(board)
#returns true if the board has not been won and is full
#returns false if the board is not won and the board is not full, and false if the board is won

  !won?(board) && full?(board)

end

def over?(board)
#returns true if the board has been won, is a draw, or is full

  won?(board) || draw?(board)

end

def winner(board)
  if won?(board) != false
      return board[won?(board)[0]]
  end

end
