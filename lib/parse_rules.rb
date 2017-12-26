module ParseRules

  def self.begin_game
    /InitGame/
  end

  def self.end_game
    /-------+/
  end

  def self.name_player
    /ClientUserinfoChanged: \d n\\(.*?)\\/
  end

  def self.kill_player
    /:\s([^:]+)\skilled\s(.*?)\sby\s[a-zA-Z_]+/
  end
end
