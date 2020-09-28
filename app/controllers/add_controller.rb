class AddController < ApplicationController
  def metodoadd
  	@nombre = params[:name]
  	@stock = params[:stock]
  	@codigo = params[:code]
  	@precio = params[:price]
  	@tipo = params[:type]
  	@id_usuario = current_user.id
  	if @nombre != nil then @producto = Product.create({nombre: @nombre, tipo: @tipo, codigo: @codigo, stock: @stock, precio: @precio, id_usuario: @id_usuario})
  	end
  end
end
