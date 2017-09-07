ActiveAdmin.register Movie do
	remove_filter :rates, :notifications, :order_items, :comments, :raters, :rates_without_dimension, :raters_without_dimension, :rate_average_without_dimension, :rating_rates, :rating_raters, :images, :slug, :covers
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :titile, :desc, :year, :time, :directors, :price, :images, :covers, :slug

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
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
