class Question < ActiveRecord::Base
  belongs_to :answer
  
  validates :text, :presence => true, :uniqueness => true
  
  def submitted_by
    self.author && !self.author.blank? ? self.author : "Anonymous"
  end
  
  before_validation :strip_whitespace
  def strip_whitespace
    self.text = self.text.strip unless self.text.nil?
    self.author = self.author.strip unless self.author.nil?
  end
end
