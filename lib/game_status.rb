board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# Helper Method
def position_taken?(board_name, index)
  !(board_name[index].nil? || board_name[index] == " ")
end

# Define winner variable
$who_won

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Center column
  [2,5,8], # Right column
  [0,4,8], # First diagonal
  [2,4,6]  # Last diagonal
  ]

def x_won?(board_name)
  WIN_COMBINATIONS.detect do |combo_array|
      combo_array.all? do |combo_index|
        position_taken?(board_name, combo_index) == true && board_name[combo_index] == "X"
      end
    end
end

def o_won?(board_name)
  WIN_COMBINATIONS.detect do |combo_array|
      combo_array.all? do |combo_index|
        position_taken?(board_name, combo_index) == true && board_name[combo_index] == "O"
      end
    end
end

def won?(board_name)

  if x_won?(board_name) != nil
    $who_won = "X"
    x_won?(board_name)

  elsif o_won?(board_name) != nil
    $who_won = "O"
    o_won?(board_name)

  else
    $who_won = nil
    return false
  end
end


def full?(board_name)
#return true if every board element is filled

  WIN_COMBINATIONS.all? do |combo_array|
    combo_array.all? do |combo_index|
      position_taken?(board_name, combo_index) == true
      end
    end
end

def draw? (board_name)
  if won?(board_name) == false && full?(board_name) == true
    return true
  elsif
    won?(board_name) == false && full?(board_name) == false
    return false
  else
    won?(board_name) == true
    #Note - not sure if I agree w/ this.  Turns the test green but "true" condition here is either the result of x_won? or o_won? methods (which are arrays)...
  end
end

def over?(board_name)

  if won?(board_name) == true || draw?(board_name) == true || full?(board_name) == true
    return true
  else
    return false
  end
end

def winner(board_name)

  won?(board_name)
  $who_won

end
