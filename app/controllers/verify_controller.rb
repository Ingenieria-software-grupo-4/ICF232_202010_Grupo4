class VerifyController < ApplicationController
  def metodoverify
  	@productos = Product.all
  end
end
