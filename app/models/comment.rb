class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attributes)
    unless user_attributes[:username].empty?
      self.user = User.find_or_create_by(username: user_attributes[:username])
    end
  end
end
