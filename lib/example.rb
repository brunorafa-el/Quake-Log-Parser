@games = []

File.open("examples/example1.txt", "r").each do |line|
  if line =~ /InitGame/
    @current_game = "new_game"
  end

  if line =~ /-------+/ && @current_game
     @games << @current_game
     @current_game = nil
  end

end

p @games
