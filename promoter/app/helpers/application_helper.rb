require 'faker'
module ApplicationHelper

	def nav_link_to (name, url, style)
	if  request.fullpath == url
		return link_to "#{name}", url, :class => 'active', :style =>'background-color: #5cb85c;'
	else
		return link_to "#{name}".html_safe,  url, :style =>'color: #5cb85c;'

	end

	end

	def sortable(column, title = nil)
		title ||= column.titleize
		css_class = column == sort_column ? "current #{sort_direction}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, {:sort => column, :direction => direction}, {:class => css_class}
	end


	def renderActionInOtherController(controller,action,params)
    c = controller.new
    c.params = params
    c.dispatch(action, request)
    c.response.body
	end


	def fakeMyData
		Blogpost.destroy_all

		50.times do 
			Blogpost.create(
				:title => Faker::Book.title,
				:author => Faker::Book.author,
				:content => Faker::Lorem.paragraph(20)
				)
				end
	end
end
