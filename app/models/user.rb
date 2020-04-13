class User < ApplicationRecord
	
	validates :name, :email, :password, presence: true
	validates :password, length: { minimum: 5 }
	validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, on: :create }
	validate :check_password

	def pass_params(params)

		@params = params
	end

	def check_password
	  if @params["user"]["password"] !=  @params["user"]["password_confirmation"]
         errors.add(:password, " should match password confirmation")

	  end
	end



end
