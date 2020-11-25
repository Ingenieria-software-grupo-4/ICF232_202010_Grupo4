class CartController < ApplicationController
	def metodocart
		@productos = Product.all

		@codigo = params[:codigo]

		if @codigo != nil then code = @codigo.split(",")
		a = Product.find_by(codigo: code[1])
		Product.find_by(codigo: code[1]).update(stock: a.stock-1)
		#codigo.value = codigo.textContent
		end
	end
end
