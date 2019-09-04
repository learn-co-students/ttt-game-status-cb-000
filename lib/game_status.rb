# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  if board.all?{|position|position == " "}
    return false
  end
  no_combinations = true
WIN_COMBINATIONS.each do |combination|
  if combination1 = board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" ||
     combination2 = board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
     no_combinations = false
    return combination
  end
 end
 if no_combinations == true
   return false
 end
end

#FULL method
def full?(board)
  any_spaces =  board.any?{|element| element == " "}
  if any_spaces== true
    return false
  else
    return true
  end
end

def draw?(board)
incomplete_board = !full?(board)
if incomplete_board == true
  return false
end
WIN_COMBINATIONS.each do |combination|
  if combination1 = board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" ||
     combination2 = board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
    return false
  end
 end
end

def over?(board)
  WIN_COMBINATIONS.each do |combination|
    if combination1 = board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" ||
       combination2 = board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      return true
    end
  end
  draw = full?(board)
     if draw == true
      return true
     else
      return false
     end
   end

   def winner(board)
       no_combinations = true
     WIN_COMBINATIONS.each do |combination|
       if combination1 = board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
           no_combinations = false
         return "X"
          elsif combination2 = board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
            no_combinations = false
         return "O"
       end
     end
     if no_combinations == true
       return nil
     end
     end
