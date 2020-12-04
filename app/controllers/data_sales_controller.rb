class DataSalesController < ApplicationController
	def metodods
		@ventas = Sale.all
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
