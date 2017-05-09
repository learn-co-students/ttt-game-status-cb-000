# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left diagonal
  [2,4,6]  # Right diagonal
]

def won?(board) #Has the game been won?
  WIN_COMBINATIONS.each do |win_combination| #iterates through each combination
    if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || #checks for X
       (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")    #checks for O
       return win_combination #returns the win_combination indexes that won.
    end
  end
   return false
end

def full?(board) #Is the board full?
    if board.include?(" ") #Does the board include blank spaces?
      return false
    end
      return true
end

def draw?(board) #Is the game a draw?
    if ((won?(board) == false) && (full?(board) == true)) #Has the game been won AND is the board full?
      return true
    end
    return false
end

def over?(board) #Is the game over?
    if ((won?(board) == true) || (draw?(board) == true) || (full?(board) == true)) #Has the game been won OR is the game a draw OR is the board full?
      return true
    end
    return false
end

def winner(board) #Who is the winner?
    if won?(board) != false #Because TRUE "won?(board)" returns win_combination.
      return board[won?(board)[0]] #Will return either X or O depending on who won.
    end
    return nil
end
