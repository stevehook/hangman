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
end
