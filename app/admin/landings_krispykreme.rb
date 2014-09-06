ActiveAdmin.register Landings::Krispykreme do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :email, :tel, :glaseadas, :surtidas, :sabores, :pagado, :fecha_envio, :costo
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  # index do
  #   column :name
  #   column :pagado
  #   column :glaseadas
  #   column :surtidas
  #   column :costo
  #   default_actions
  # end
  
end
