class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :job

  def self.created_at
    
  end
  
  def self.updated_at
    
  end

end