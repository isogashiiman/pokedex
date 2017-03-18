module TypesHelper
	def type_badge_content(name, color)
		raw "<span style ='background-color: #{color}' class='badge'> #{name}
		</span>"
	end
	def type_badge(type, name = nil)
		return '&empty;'.html_safe if type.nil?
		name ||= type.name
		raw link_to type.badge_content(name, type.color), type_path(type.id)
	end
end
