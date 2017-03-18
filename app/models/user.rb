class User < ApplicationRecord
	devise :database_authentificatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	validates :username, presence: true, uniqueness: true
end