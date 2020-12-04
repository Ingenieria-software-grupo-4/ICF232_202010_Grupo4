class DataSalesController < ApplicationController
	def metodods
		filtro = Sale.where(:FechaVenta => Date.today-999999 .. Date.today)
		@ventas = filtro.where(us: current_user.id)
		@codigosventa = []

		@ventas.each do |x|
			codigos = x.codigo.split(',')
			@codigosventa = @codigosventa + codigos
		end
		puts("Estos son los objetos vendidos historicos #{@codigosventa}")
		@productos = @codigosventa.uniq
		puts("Estos son los objetos vendidos historicos #{@productos}")
	end

end
