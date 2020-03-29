class Admins::SearchesController < Admins::BaseController
	before_action :authenticate_admin!

	def search
		@model = params["search"]["model"]
		@content = params["search"]["content"]
		@how = params["search"]["how"]
		@datas = search_for(@how, @model, @content)
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
			Member.where(total_name: content)
		elsif model == 'product'
			Product.where(name: content)
		end
	end

	def forward(model, content)
		if model == 'member'
			Member.where("total_name LIKE ?", "#{content}%")
		elsif model == 'product'
			Product.where("name LIKE ?", "#{content}%")
		end
	end
	def backward(model, content)
		if model == 'member'
			Member.where("total_name LIKE ?", "%#{content}")
		elsif model == 'product'
			Product.where("name LIKE ?", "%#{content}")
		end
	end

	def partical(model, content)
		if model == 'member'
			Member.where("total_name LIKE ?", "%#{content}%")
		elsif model == 'product'
			Product.where("name LIKE ?", "%#{content}%")
		end
	end
end
