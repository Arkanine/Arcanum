ActiveAdmin.register Company do
  permit_params :name, :address, :phone, :user_id, :tag_id

  index do
    column :created_at
    column :name
    column :address
    column :phone
    column :user
    column :tag


    default_actions
  end

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
