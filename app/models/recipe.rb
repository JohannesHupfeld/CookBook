class Recipe < ActiveRecord::Base
  belongs_to :user

  def formatted_created_at
    self.created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def formatted_updated_at
    self.updated_at.strftime("%A, %d %b %Y %l:%M %p")
  end
end

