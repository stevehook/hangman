require "./players/hard_of_thinking_player"

describe HardOfThinkingPlayer do
  context "after creating a new player" do
    before(:each) do
      @player = HardOfThinkingPlayer.new
    end

    it "should know its name" do
      @player.name.should == 'Steve'
    end
  end

  context "after creating a game with six words" do
    before(:each) do
      @player = HardOfThinkingPlayer.new
      @player.new_game(%w{this that there then threw throw})
    end

    it "should work out the chars by frequency for the 4 character words" do
      @player.chars_by_frequency_for('____').should == {"t"=>4, "h"=>3, "i"=>1, "s"=>1, "a"=>1, "e"=>1, "n"=>1}
    end
  end
end
