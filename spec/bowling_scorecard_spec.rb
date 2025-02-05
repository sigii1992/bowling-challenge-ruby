require 'bowling_scorecard'

describe Scorecard do
  let(:game) { Scorecard.new }
  
  describe "#roll" do
    it 'it adds first and second roll to the scorecard' do
      game.roll(5,3)
      expect(game.scorecard).to include([5,3])
    end

    it 'it sums first and second roll and adds summ to the frame scores array' do
      game.roll(5,3)
      expect(game.frame_scores).to include 8
    end

    it 'incremets frame index by 1 with every roll' do
      game.roll(5,3)
      game.roll(10)
      game.roll(7,2)
      expect(game.frame_index).to eq 2
    end
  end

  describe '#scores' do
    it "updates total scores" do
      game.roll(5,3)
      game.roll(7,2)
      expect(game.scores).to eq 17
    end
  end
  
  describe '#strike' do
    it 'check if it is a strike' do
      game.roll(10)
      expect(game.strike?).to eq true
    end
  end

  describe '#spare' do
    it 'check if it is a spare' do
      game.roll(4,6)
      expect(game.spare?).to eq true
    end
  end
end