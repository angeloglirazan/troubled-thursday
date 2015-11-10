require 'rails_helper'

RSpec.describe Question, :type => :model do

  it "is invalid without text (with or without spaces)" do
    q_one = Question.create(
      :text => "",
      :author => "Aye B.")
    expect(q_one).not_to be_valid
    q_two = Question.create(
      :text => " ",
      :author => "Bee C.")
    expect(q_two).not_to be_valid
  end
  
  it "shows 'Anonymous' with 'submitted_by' method if author is blank (with or without spaces)" do
    q_one = Question.create(
      :text => "Hello world",
      :author => "")
    expect(q_one.submitted_by).to eq "Anonymous"
    q_two = Question.create(
      :text => "Hello wide world",
      :author => " ")
    expect(q_two.submitted_by).to eq "Anonymous"
  end
  
  it "can not be a duplicate" do
    q_one = Question.create(
      :text => "Hi world",
      :author => "Aye B.")
    q_two = Question.create(
      :text => "Hi world",
      :author => "Aye B.")
    expect(q_two).not_to be_valid
  end
  
end
