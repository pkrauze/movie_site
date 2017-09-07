ActiveAdmin.register Movie do
	remove_filter :rates, :notifications, :order_items, :comments, :raters, :rates_without_dimension, :raters_without_dimension, :rate_average_without_dimension, :rating_rates, :rating_raters, :images, :slug, :covers
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
