# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  has_secure_password
  #before_filter :signed_in_user, only: [:edit, :update]

  before_save :create_remember_token

  validates :username, :presence=> true, :length=>{:maximum=> 50}
  validates :password, :presence => true, :length=>{ :minimum => 6 }
  validates :password_confirmation, :presence => true
	  def create_remember_token
	  	self.remember_token = SecureRandom.urlsafe_base64
	  end
    #def signed_in_user
    #  redirect_to signin_url, notice: "Please sign in." unless signed_in?
    #end
  	private
end