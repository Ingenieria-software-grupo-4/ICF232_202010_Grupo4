class ReportController < ApplicationController
	def metodorep
		#variable que guarda records de venta
		@user_day_sales = Sale.where(:us => current_user.id)
		
		# productos
		allp = Product.where(:id_usuario => current_user.id)
		######################################
		@venta_box = Hash.new

		arr_1 = Array.new

		arr_2 = Array.new

		@user_day_sales.each do |j|

			partial_prod = j.codigo #variable temporal de guardado de array de codigos de productos

			tok = partial_prod.split(",") #dividimos el array de productos

			all_name_str = "" #variable inicializada para guardar una cadena de nombres
			total_sale = 0
			tok.each do |cod_spliten| #cambiamos los codigos por nombres y obtenemos el monto total de venta segun producto
				allp.each do |cod_p|
					if cod_spliten == cod_p
						all_name_str = all_name_str + " " + allp.nombre
						total_sale = total_sale + cod_p.precio
					end
				end
			end
			arr_1 << all_name_str
			arr_2 << total_sale
			#tenemos el string de nombres de prod y precio, ahora lo anyadims a un array
			

			partial_prod = nil #vaciamos la variable parcial para evitar cualquier error
			tok = nil
		end
		

		arr_1.each_with_index do |par1, par2|
			@venta_box[par1] = arr_2[par2]
		end
		
		
	end
end
