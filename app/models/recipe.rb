class Recipe < ActiveRecord::Base
  belongs_to :user

  def formatted_created_at
    self.created_at.to_date
end

