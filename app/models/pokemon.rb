class Pokemon < ApplicationRecord
	belongs_to :type, optional: true
	has_many :pokemon_moves
	has_many :moves, through: :pokemon_moves

	has attached_file :avatar, style: {
		medium: "300x300>",
		thumb: '100x100>'
	}
	validates_attachment_content_type :avatar,
	content_type: /\Aimag/
	validates_attachment_content_name :avatar,
	 matches: [/png\Z, /jpe?g\Z/, /gif\Z/]
	 validates_witch AttachementSizeValidator,
	 	attributes:
end
