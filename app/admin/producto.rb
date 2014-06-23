ActiveAdmin.register Producto do

  
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

  permit_params :name, :price, :image, :estado_id, :categoria_id, :description

  #Add and edit

  form do |f|
    f.inputs "Producto Details" do
      f.input :name
      f.input :estado_id, :label => 'Estado', :as => :select, :collection => Estado.all.map{|e| [e.name, e.id]}
      f.input :categoria_id, :label => 'Categoria', :as => :select, :collection => Categoria.all.map{|e| [e.name, e.id]}
      f.input :price
      f.input :description, :input_html => { :class => 'autogrow', :rows => 10, :cols => 20 }
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:thumb))
      # Will preview the image when the object is edited
    end
    f.actions
  end

  #columns

  index do |item|
    selectable_column
    id_column
    column :name
    column :estado
    column :categoria
    column :price


    actions
  end

  #show

  show do |ad|
    attributes_table do
      row :name
      row :estado
      row :categoria
      row :description
      row :price
      row :image do
        link_to image_tag(ad.image.url(:thumb)), ad.image.url
      end
    end
    active_admin_comments
  end
  
end
