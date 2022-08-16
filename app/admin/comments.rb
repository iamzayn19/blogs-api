ActiveAdmin.register Comment, :as => "BlogComment" do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :text, :blog_id, :user_id, :discarded_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:text, :blog_id, :user_id, :discarded_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
