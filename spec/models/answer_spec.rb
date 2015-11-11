require 'rails_helper'

RSpec.describe Answer, :type => :model do
  it "is invalid without text (with or without spaces)" do
    a_one = Answer.create(
      :text => ""
      :admin_id => 0)
    expect(a_one).not_to be_valid
    a_two = Answer.create(
      :text => " "
      :admin_id => 0)
    expect(a_two).not_to be_valid
  end
end
