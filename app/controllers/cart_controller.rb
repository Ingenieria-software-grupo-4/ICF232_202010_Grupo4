class CartController < ApplicationController
	def metodocart
		@productos = Product.all
	end
end
