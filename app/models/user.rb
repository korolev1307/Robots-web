class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def move_to(user, current_user)
  	puts "MOVING"
    Order.where(:user_id => current_user).update_all(user_id: user.id)
  end

  def delete_old_guests
    User.where(guest: true).where(['created_at < ?', 7.days.ago]).destroy_all
  end
end
