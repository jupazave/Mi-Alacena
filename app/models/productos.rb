class Productos < ActiveRecord::Base

	belongs_to :estado
  	validates_presence_of :estado_id
  	
end
