class CartController < ApplicationController
	def metodocart
		@productos = Product.where(id_usuario: current_user.id)

		@codigos = params[:codigo]
		puts(" el codigo es #{@codigos}")
		return if @codigos.blank? 

		@codigosv = @codigos.split(",")
		#puts ("	ESTE ES CODE -----------#{@codigos}")
		 ActiveRecord::Base.transaction do 
			#puts(Product.where(codigo: @codigos).inspect)
			#arreglar haciendo un for
			#Product.where(codigo: @codigosv).each do |codigo|
			@codigosv.each do |codigo|
				a = Product.find_by(codigo: codigo)
				Product.find_by(codigo: codigo).update(stock: a.stock-1)
				#puts("logra entrar al actualizar")
			end
		end
		@monto = 0
			@codigosv.each do |codigo|
				b = Product.find_by(codigo: codigo)
				@monto = @monto + b.precio
				#puts("logra entrar al actualizar")
			end
		Sale.create({codigo: @codigos, monto: @monto, FechaVenta: Date.today, us: current_user.id})
		#codigo.value = codigo.textContent
	end
end
