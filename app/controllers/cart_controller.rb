class CartController < ApplicationController
	def metodocart
		@productos = Product.all

		@codigos = params[:codigo]
		puts(" el codigo es #{@codigos}")
		return if @codigos.blank? 

		@codigos = @codigos.split(",")
		puts ("	ESTE ES CODE -----------#{@codigos}")
		 ActiveRecord::Base.transaction do 
			puts(Product.where(codigo: @codigos).inspect)
			Product.where(codigo: @codigos).each do |codigo|
				codigo.update(stock: codigo.stock-1)
				puts("logra entrar al actualizar")
			end
		end
		#codigo.value = codigo.textContent
	end
end
