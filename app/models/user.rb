class User < ApplicationRecord
	validates :name, :email, :password, presence: true
	validates :password, length: { minimum: 5 }
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, on: :create }

	def self.check_password(params)
		params["user"]["password"] == params["user"]["password_confirmation"] ? true : false
	end
end
