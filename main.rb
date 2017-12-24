require_relative 'game'

@games = []
@player_names = []

File.open("example1.txt", "r").each do |line|
  if line =~ /InitGame/
    @current_game = Game.new
  end

  if line =~ /ClientUserinfoChanged: \d n\\(.*?)\\/
    @player_names << line.scan(/ClientUserinfoChanged: \d n\\(.*?)\\/)
    @current_game.name = @player_names.uniq
  end

  if line =~ /-------+/ && @current_game
     @games << @current_game
     @current_game = nil
  end

end
