class VerifyController < ApplicationController
  def metodoverify
  	@productos = Product.where(id_usuario: current_user.id)
  end
end
