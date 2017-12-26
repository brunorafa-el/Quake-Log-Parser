class Game
  attr_accessor :name, :kills

  def kills_number
    b = Hash.new(0)

    if @kills != nil
      @kills.each do |v|
        b[v[0]] += 1
      end
    end

    b.each do |k, v|
      puts "#{k}: #{v}"
    end
  end
end
