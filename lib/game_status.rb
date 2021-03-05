# Helper Method
board = [" ", "X", "X", " ", " ", " ", " ", " ", " "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6],[1, 4, 7], [2, 5, 8], [0,4,8], [2,4,6]]

def won(board)

  counter = 0

  WIN_COMBINATIONS.each do |win|
   win.each do |position|
    if board[position] == "X" || board[position]== "O"
      counter = counter + 1
    end
    if counter == 3
      return win
    end
   end
   counter = 0
  end

end

puts won(board)
