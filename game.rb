class Game

  attr_reader :player1, :player2, :current_player

  def initialize
    puts "Enter first player name: "
    player1name = gets.chomp
    @player1 = Player.new(player1name)
    puts "Enter second player name: "
    player2name = gets.chomp
    @player2 = Player.new(player2name)
    @current_player = @player1
    puts "#{@current_player.name}"
  end

  def start
    while @player1.lives > 0 && @player2.lives > 0
      ask_question
    end
      puts "#{@current_player.name} loses!"
  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def ask_question

    q = Question.new
    q.generate_question
    player_answer = gets.chomp
    result = q.verify_answer(player_answer)

    if result == true
      puts "good job! fluke though!"
      puts "#{@current_player.name} score: #{current_player.lives}"
    else
      puts "bad job! why are you in this program?!"
      p = @current_player.lives
      puts p
      p -= 1
      puts p
      puts "#{current_player.name} score: #{current_player.lives}"
    end

    switch_player

  end


end