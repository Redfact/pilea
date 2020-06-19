class User < ApplicationRecord
    has_many :selections
    has_many :coins, through: :selections

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send
  
  def welcome_send
    puts 'sending welcome mail...'
    UserMailer.welcome_email(self).deliver_now!
  end

  def admin?
    return self.admin==true
  end

  def already_liked(coin_id)
    return self.coins.include?(Coin.find_by(id:coin_id))
  end

end
