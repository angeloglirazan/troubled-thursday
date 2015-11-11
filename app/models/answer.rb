class Answer < ActiveRecord::Base
  has_one :question
  
  validates :text, :presence => true
  
  before_validation :strip_whitespace
  def strip_whitespace
    self.text = self.text.strip unless self.text.nil?
  end
end
