ActiveAdmin.register User do
	remove_filter :subscribers,  :notifications, :comments, :rates, :roles, :rater, :encrypted_password, :reset_password_token, :remember_created_at, :reset_password_sent_at, :ratings_given 

	scope :all, default: true
	scope :admins do |users| users.with_role(:admin) end
	scope :moderators do |users| users.with_role(:moderator) end
	scope :users do |users| users.with_role(:user) end

	index do
		column :id
		column :email
		column :last_sign_in_at
		column :created_at
		actions
	end
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
