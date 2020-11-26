class CartController < ApplicationController
	def metodocart
		@productos = Product.all

		@codigos = params[:codigo]
		#puts(" el codigo es #{@codigos}")
		return if @codigos.blank? 

		@codigosv = @codigos.split(",")
		#puts ("	ESTE ES CODE -----------#{@codigos}")
		 ActiveRecord::Base.transaction do 
			#puts(Product.where(codigo: @codigos).inspect)
			Product.where(codigo: @codigosv).each do |codigo|
				codigo.update(stock: codigo.stock-1)
				#puts("logra entrar al actualizar")
			end
		end
		@monto = 0
		Product.where(codigo: @codigosv).each do |codigovent|
				@monto = @monto + codigovent.precio
				#puts("logra entrar al actualizar")
			end
		Sale.create({codigo: @codigos, monto: @monto})
		#codigo.value = codigo.textContent
	end
end
