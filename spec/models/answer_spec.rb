require 'rails_helper'

RSpec.describe Answer, :type => :model do
  it "is invalid without text (with or without spaces)" do
    a_one = Answer.new(
      :text => "",
      :admin_id => 0)
    a_one.valid?
    expect(a_one.errors[:text]).to include("can't be blank")
    a_two = Answer.new(
      :text => " ",
      :admin_id => 0)
      a_two.valid?
    expect(a_two.errors[:text]).to include("can't be blank")
  end
end
