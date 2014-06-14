class Productos < ActiveRecord::Base

	belongs_to :estados
  	validates_presence_of :estados_id
  	
end
