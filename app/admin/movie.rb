ActiveAdmin.register Movie do
	remove_filter :rates, :notifications, :order_items, :comments, :raters, :rates_without_dimension, :raters_without_dimension, :rate_average_without_dimension, :rating_rates, :rating_raters, :images, :slug, :covers
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	preserve_default_filters!
	filter :director , :as => :select, :collection => Director.all.map(&:fullname)
#
# or
	index do
		column :id
		column :title
		column :desc
		column :year
		column :time
		column :director do |d|
			director = Director.find(d.director_id).fullname
		end
		column :price
		actions
	end

	form do |f|
		f.inputs "Details" do
			f.input :title
			f.input :desc
			f.input :year
			f.input :time
			f.input :price
		end
		f.inputs "Director" do
			f.semantic_fields_for :director, f.object.director || f.object.build_director do |d|
				d.input :firstname
				d.input :lastname
				d.input :year_of_birth
			end
		end
		f.actions
	end

	controller do
  	def permitted_params
  		params.permit movie: [:title, :desc, :year, :time, :directors, :price, :images, :covers, :slug, director_attributes: [:firstname, :lastname, :year_of_birth]]
  	end
	end

end
