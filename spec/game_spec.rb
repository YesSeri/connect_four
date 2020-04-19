require 'game'

describe "Game" do
  def load_get_name
    get_name
  end
  describe 'get_name'
    it "gets name from player" do #Please enter Henrik
      expect(load_get_name).to eq(get_name)
    end
end

