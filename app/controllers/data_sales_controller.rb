class DataSalesController < ApplicationController
	def metodods
		#tomamos las ventas del usuario en uso
		@generalsales = Sale.where(:us => current_user.id) 
		#ahora tomamos todos los productos de el usuario para luego guardarlos en el tp 3
		@p = Product.where(:id_usuario => current_user.id )
		
		
		

		@stats = Hash["nom1" => "none","primero" => 0 ,"nom2" => "none", "segundo" => 0 ,"nom3" => "none", "tercero" => 0] #lista para ver los primeros 3 items mas vendidos
		#PARA GENERALIZAR, LO QUE HACE LA FUNCION ES TOMARLA LISTA DE PRODUCTOS DEL USUARIO Y LUEGO
		#CONTAR CUANTAS VECES SE HA VENDIDO EL PRODUCTO, LUEGO LO COLOCA EN UN TOP 3
		#VA A HACER LO MISMO CON CADA PRODUCTO EL USUARIO, ASI QUE EL TOP ES DINAMICO.
		#j = lista de productos del usuario actual
		@p.each do |j|
			#variable que permite acumular el total de venta de 1 articulo
			@var = 0
			#sumatoria del articulo ------ k = en teoria las ventas del usuario actual
			@generalsales.each do |k|
				#guardamos el string completo de produtos en una variable independiente
				tok = k.codigo
				#dividimos los elementos del string en varias partes y lo guardamos en un array
				@var2 = tok.split(",")
				#recorremos el array con la misma logica

				@var2.each do |z|
					if j.codigo == z.to_i
					@var = @var + 1
					end
				end
			end
			tok = nil
			
			#comparacion del articulo top 3 y la guardado en hash
			#falta mover de lugar a los primeros lugares,,,, puede que se puerdan datos
			if @stats['primero'] < @var
				#cambia de lugares 1->2, 2->3, nuevo->1
				@stats['tercero'] = @stats['segundo']	
				@stats['nom3'] = @stats['nom2']
				@stats['segundo'] = @stats['primero']
				@stats['nom2'] = @stats['nom1']
				@stats['primero'] = @var
				@stats['nom1'] = j.nombre

			elsif @stats['segundo'] < @var
				@stats['tercero'] = @stats['segundo']	
				@stats['nom3'] = @stats['nom2']
				@stats['segundo'] = @var
				@stats['nom2'] = j.nombre

			elsif @stats['tercero'] < @var
				@stats['tercero'] = @var	
				@stats['nom3'] = j.nombre

			end
			
		end
	end

end
