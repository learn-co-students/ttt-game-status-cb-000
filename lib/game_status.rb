# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
#win combination is a nested arrary
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],# Middle row
  [6,7,8], # bottom row
  [0,3,6], # first collums
  [1,4,7],# second columns
  [2,5,8], # 3rd collums
  [2,4,6], #diagonals
  [0,4,8] #diagonals
]
=begin
my implimentation.. however the over?function wouldn work
 def won?(board)
  top_row      = WIN_COMBINATIONS[0]    # this probaly could have been better writen using select or detect method
  middle_row   = WIN_COMBINATIONS[1]
  bottom_row   = WIN_COMBINATIONS[2]
  first_column = WIN_COMBINATIONS[3]
  second_column= WIN_COMBINATIONS[4]
  third_column = WIN_COMBINATIONS[5]
  diagonals_1  = WIN_COMBINATIONS[6]
  diagonals_2  = WIN_COMBINATIONS[7]
  if board[top_row [0]]== "X" && board[top_row[1]]=="X" && board[top_row[2]]=="X"        #inseception level thinking lol
    return top_row
  elsif board[middle_row [0]]== "X" && board[middle_row[1]]=="X" && board[middle_row[2]]=="X"        #inseception level thinking lol
      return middle_row
  elsif board[bottom_row [0]]== "X" && board[bottom_row[1]]=="X" && board[bottom_row[2]]=="X"        #inseception level thinking lol
        return bottom_row

  elsif board[first_column[0]]== "O" && board[first_column[1]]=="O" && board[first_column[2]]=="O"        #inseception level thinking lol
          return first_column
  elsif board[second_column [0]]== "O" && board[second_column[1]]=="O" && board[second_column[2]]=="O"        #inseception level thinking lol
            return second_column
  elsif board[third_column[0]]== "O" && board[third_column[1]]=="O" && board[third_column[2]]=="O"        #inseception level thinking lol
              return third_column
  elsif board[diagonals_1[0]]== "O" && board[diagonals_1[1]]=="O" && board[diagonals_1[2]]=="O"        #inseception level thinking lol
                return diagonals_1
  elsif board[diagonals_2[0]]== "X" && board[diagonals_2[1]]=="X" && board[diagonals_2[2]]=="X"        #inseception level thinking lol
                return diagonals_2
  else
    return false
  end
=end



def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
