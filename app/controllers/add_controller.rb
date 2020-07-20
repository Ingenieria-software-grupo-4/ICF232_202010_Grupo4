class AddController < ApplicationController
  def metodoadd
  	@nombre = params[:name]
  	@stock = params[:stock]
  	@codigo = params[:code]
  	@precio = params[:price]
  	@tipo = params[:type]

  	@producto = Product.create({nombre: @nombre, tipo: @tipo, codigo: @codigo, stock: @stock, precio: @precio})
  end
end
