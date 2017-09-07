ActiveAdmin.register Director do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :firstname, :lastname, :year_of_birth, :images
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	form do |f|
    f.inputs "Details" do
      f.input :firstname
      f.input :lastname
      f.input :year_of_birth
    end
    f.actions
  end


end
