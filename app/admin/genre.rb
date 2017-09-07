ActiveAdmin.register Genre do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	remove_filter :movies, :subscribers, :notifications, :slug, :images

	permit_params :name, :slug, :images

	index do
		column "#", :id
		column :name
		column :created_at
	end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
