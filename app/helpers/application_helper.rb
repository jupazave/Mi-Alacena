module ApplicationHelper
	def asset_url asset
  		"#{request.protocol}#{request.host_with_port}#{asset_path(asset)}"
	end

	def get_month month
		s = nil
		case month.to_i
		when 1
			s = "Enero"
		when 2
			s = "Febrero"
		when 3
			s = "Marzo"
		when 4
			s = "Abril"
		when 5
			s = "Mayo"
		when 6
			s = "Junio"
		when 7
			s = "Julio"
		when 8
			s = "Agosto"
		when 9
			s = "Septiembre"
		when 10
			s = "Octubre"
		when 11
			s = "Noviembre"
		when 12
			s = "Diciembre"
		
		end

		puts "============================================================"
		puts s.nil?
		puts month.to_i
		s
	end
end
