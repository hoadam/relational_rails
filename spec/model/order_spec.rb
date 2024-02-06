require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "relationship" do
    it { should belong_to(:customer) }
  end
end
