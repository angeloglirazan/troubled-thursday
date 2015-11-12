class Question < ActiveRecord::Base
  belongs_to :answer
  
  validates :text, :presence => true, :uniqueness => true
  
  def submitted_by
    self.author && !self.author.blank? ? self.author : "Anonymous"
  end
  
  def answered_by
    self.answer && self.answer.admin_user_id ? AdminUser.find(self.answer.admin_user_id).name : false
  end
  
  before_validation :strip_whitespace
  def strip_whitespace
    self.text = self.text.strip unless self.text.nil?
    self.author = self.author.strip unless self.author.nil?
  end
  
  accepts_nested_attributes_for :answer
end
