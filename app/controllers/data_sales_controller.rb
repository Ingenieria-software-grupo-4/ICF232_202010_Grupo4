class DataSalesController < ApplicationController
	def metodods
		
		@generalsales = Sale.all     #where(:us => current_user.id) falta tomar solo los datos del usuario
		@generalsales.each do |i|
				@allsales_user = SaleDetail.where(:codigo_venta => i.codigo )
		end

		@p = Product.where(:id_usuario => current_user.id )
		#j = lista de productos del usuario actual
		#k = en teoria las ventas del usuario actual
		#lista para ver los primeros 3 items mas vendidos

		@stats = Hash["nom1" => "none","primero" => 0 ,"nom2" => "none", "segundo" => 0 ,"nom3" => "none", "tercero" => 0]

		@p.each do |j|
			#variable que permite acumular el total de venta de 1 articulo
			var = 0
			#sumatoria del articulo 
			@allsales_user.each do |k|
				#guardamos el array de produtos en una variable independiente
				var2 = k.productos
				var2.each do |z|
					if j.codigo = z
					var = var + 1
					end
				end
			end
			#comparacion del articulo top 3 y la guardado en hash
			#falta mover de lugar a los primeros lugares,,,, puede que se puerdan datos
			if @stats['primero'] < var
				#cambia de lugares 1->2, 2->3, nuevo->1
				@stats['tercero'] = @stats['segundo']	
				@stats['nom3'] = @stats['nom2']
				@stats['segundo'] = @stats['primero']
				@stats['nom2'] = @stats['nom1']
				@stats['primero'] = var
				@stats['nom1'] = j.nombre

			elsif @stats['segundo'] < var
				@stats['tercero'] = @stats['segundo']	
				@stats['nom3'] = @stats['nom2']
				@stats['segundo'] = var
				@stats['nom2'] = j.nombre

			elsif @stats['tercero'] < var
				@stats['tercero'] = var	
				@stats['nom3'] = j.nombre

			end

		end
	end

end
