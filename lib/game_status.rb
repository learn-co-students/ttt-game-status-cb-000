# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  combo = 0
    while combo < WIN_COMBINATIONS.length
      current_combo = WIN_COMBINATIONS[combo]

      win1 = current_combo.all? { |position| board[position] == "X" }
      win2 = current_combo.all? { |position| board[position] == "O" }

      if win1 == true || win2 == true
        return current_combo
      else
       false
      end

      combo += 1
    end
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  draw?(board) || full?(board) || won?(board)
end

def winner?(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
