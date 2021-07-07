# Helper Method

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =  [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
#board = ["O", "O", "X","O", "O", "X","O", "X", "O"]
#board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#board = ["X", " ", " ", "X", " ", " ", "X", " ", " "]
def won?(board)
    winner = WIN_COMBINATIONS.detect do |winArray|
        position1 = board[winArray[0]]
        position2 = board[winArray[1]]
        position3 = board[winArray[2]]
        (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
    end #end of WIN_COMBINATIONS.each

    if !winner.nil?
      winner
    else
      false
    end
end

def full?(board)
    emptySpace = board.include?(" ")
    nilSpace = board.include?(nil)

    !(emptySpace || nilSpace)

end

def draw?(board)
   if full?(board) == true && won?(board) == false
     true

   else
     false

   end

 end

def over?(board)
  won?(board) || draw?(board) || full?(board)

end

def winner(board)

  if won?(board) != false

    winComb = won?(board)
    winner = board[winComb[0]]


else
  nil
end

end
