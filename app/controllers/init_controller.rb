class InitController < ApplicationController
  def index
  	@kk = Fecha.find(1)
  	@cazola = Fecha.find(2)
  	@kk_surtida = Fecha.find(3)
  	@bolita = Fecha.find(4)
  	@hojaldra = Fecha.find(5)
  end
end
