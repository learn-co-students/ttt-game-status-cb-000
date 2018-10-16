# Helper Method
def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # End row
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def won?(board)
    if [0,1,2,3,4,5,6,7,8].none?{|e| position_taken?(board,e) }
      return false
    end
    WIN_COMBINATIONS.each do |win_combo|
        temp = win_combo.all?{|e| board[e]=='X'}
        temp1 = win_combo.all?{|e| board[e]=='O'}
      if win_combo.all?{|e| board[e]=='X'} || win_combo.all?{|e| board[e]=='O'}
        return win_combo
      end
    end
    return false
  end

  def full?(board)
    board.all? { |e| e=='X' || e=='O' }
  end

  def draw?(board)
    !won?(board) and full?(board)
  end

  def over?(board)
    won?(board) || draw?(board) || full?(board)
  end

  def winner(board)
    if won?(board).class != Array
        return nil
    end
    board[won?(board)[0]]
  end
