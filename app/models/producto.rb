class Producto < ActiveRecord::Base
	belongs_to :estado
	belongs_to :categoria

	has_attached_file :image, :styles => { :normal => "500x500>",:medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
