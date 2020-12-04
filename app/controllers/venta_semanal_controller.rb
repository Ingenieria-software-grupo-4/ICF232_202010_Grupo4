class VentaSemanalController < ApplicationController
	def metodoventa_semanal
		sale = Sale.where(us: current_user.id)
		@ventassemana = sale.where(:FechaVenta => Date.today-7 .. Date.today)
		@array = []
		@arrayids = []

		@ventassemana.each do |b|
			ids = b.id
			@arrayids = @arrayids.push(ids)
		end

		@ventassemana.each do |v|
			codigos = v.codigo.split(',')
			@array = @array + codigos
		end

		@monto = 0
		@array.each do |a|
			@monto = @monto + Product.find_by(codigo: a).precio
		end
		puts("este es array #{@array}")
		puts("este es array #{@arrayids}")
	end
end
