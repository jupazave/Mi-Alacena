class Estado < ActiveRecord::Base
	validate :only_one
  private
  def only_one
    if Estado.count >= 32
      errors.add :base, 'You can not add more \'Estados\'.' 
    end
  end
end
