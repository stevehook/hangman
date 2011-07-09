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
      @player.new_game(%w{this than there then threw throw})
    end

    it "should work out the chars by frequency for the 4 character words" do
      @player.chars_by_frequency_for('____').should == {"t"=>3, "h"=>3, "i"=>1, "s"=>1, "a"=>1, "e"=>1, "n"=>2}
    end

    it "should work out the chars by frequency for the 4 character words starting with t" do
      @player.chars_by_frequency_for('t___').should == {"t"=>3, "h"=>3, "i"=>1, "s"=>1, "a"=>1, "e"=>1, "n"=>2}
    end

    it "should work out the chars by frequency for the 4 character words starting with t and ending with n" do
      @player.chars_by_frequency_for('t__n').should == {"t"=>2, "h"=>2, "n"=>2, "e"=>1, "a"=>1}
    end

    it "should not find an exact single word match for 'th_n'" do
      @player.exact_match('th_n').should be_nil
    end

    it "should find an exact single word match for 'the_'" do
      @player.exact_match('the_').should == 'then'
    end

    it "should find an exact single word match for 'the_/th__'" do
      @player.exact_match('the_/th__').should == 'then'
    end

    it "should find an exact single word match for 't___/____e'" do
      @player.exact_match('t___/____e').should == 'there'
    end

    it "should find an exact phrase match for 'the_/____e'" do
      @player.exact_match('the_/____e').should == 'then/there'
    end
  end
end
