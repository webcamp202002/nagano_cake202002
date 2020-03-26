class Admins::SearchesController < Admins::BaseController

	def search
		@model = params["search"]["model"]
		@content = params["search"]["content"]
		@how = params["search"]["how"]
		@datas = search_for(@how, @model, @content)
		binding.pry
	end
	def search_for(how, model, content)
		p '---------'
		p how
		case how
		when 'match'
			match(model, content)
		when 'forward'
			forward(model, content)
		when 'backward'
			backward(model, content)
		when 'partical'
			partical(model, content)
		end
	end

	def match(model, content)
		if model == 'member'
			Member.where("lower(SELECT CONCAT_WS(",", lower(first_name), lower(last_name)) like ?","#{content}")
		elsif model == 'product'
			Product.where(name: content)
		end
	end

	def forward(model, content)
		if model == 'member'
			Member.where("lower(members.first_name) like ? OR lower(members.last_name) like ?","#{content}%","#{content}%")
		elsif model == 'product'
			Product.where("name LIKE ?", "#{content}%")
		end
	end
	def backward(model, content)
		if model == 'member'
			Member.where("lower(members.first_name) like ? OR lower(members.last_name) like ?","%#{content}","%#{content}")
		elsif model == 'product'
			Product.where("name LIKE ?", "%#{content}")
		end
	end

	def partical(model, content)
		if model == 'member'
			Member.where("lower(members.first_name) like ? OR lower(members.last_name) like ?","%#{content}%","%#{content}%")
		elsif model == 'product'
			Product.where("name LIKE ?", "%#{content}%")
		end
	end
end
