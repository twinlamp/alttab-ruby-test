require 'rails_helper'

RSpec.describe Tile do
  subject { Tile.new(x: 0, y: 1) }

  describe "#inv" do
    it 'returns x when given y and vice-versa' do
      expect(subject.inv(:x)).to eq(y: subject.y)
      expect(subject.inv(:y)).to eq(x: subject.x)
    end
  end
end
