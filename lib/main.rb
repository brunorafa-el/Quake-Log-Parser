require_relative 'game'
require_relative 'parse_rules'

@games = []
@player_names = []
@kills = []

file = "../examples/games.log"
File.open(file, "r").each do |line|
  # Beginning game
  if line =~ ParseRules.begin_game
    @current_game = Game.new
  end
  # Catch players' names
  if line =~ ParseRules.name_player
    @player_names += line.scan(ParseRules.name_player)
    @current_game.name = @player_names.uniq.flatten!
  end
  # Catch players' kills (broken)
  if line =~ ParseRules.kill_player
    @kills += line.scan(ParseRules.kill_player)
    @current_game.kills = @kills
  end
  # End game
  if line =~ ParseRules.end_game && @current_game
     @games << @current_game
     @current_game = nil
  end
end

@games.each do |x|
  puts "Players: #{x.name}\n"
  puts "Kills: ["
  x.kills_number
  puts "]\n\n\n"
end
