class ReportController < ApplicationController
	def metodorep
		sale = Sale.where(us: current_user.id)
		@ventasdia = sale.where(FechaVenta: Date.today)
		@array = []
		@arrayids = []

		@ventasdia.each do |b|
			ids = b.id
			@arrayids = @arrayids.push(ids)
		end

		@ventasdia.each do |v|
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
