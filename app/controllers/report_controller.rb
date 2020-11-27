class ReportController < ApplicationController
	def metodorep
		#toma las ultimos 10 codigos de ventas de usuario
		@sales_user = Sale.where(:us => current_user.id, :limit => 10)

		#tomamos todas 
		@sales_user.each do |i|
			@user_day_sales = SaleDetail.where(:codigo_venta => i.codigo )
		end
		#variable para corresponder los productos del usuario con las ventas
		@p = Product.where(:id_usuario => current_user.id )
		#ahora en una variable recorremos los productos vendidos de las 10 ultimas ventas
		@user_day_sales.each do |j|

			partial_prod = j.productos #variable temporal de guardado de array

			partial_prod.each do |m| #recorremos el array de productos

				@codigo_prod = hash.new(m) #en teoria cada producto se guarda en la variable codigo_prod

			end 

			partial_prod = nil #vaciamos la variable parcial para evitar cualquier error

		end
		#una vez terminado el proceso paramos a guardar en otra variable las ventas para mostrarlas en la vista

		@codigo_prod.each do |n|
			@prod_to_see = Product.where(:codigo => n)
		end
		#dinero ingresado de las ventas hechas en 1 dia y 1 semana
		#guardamos en 1 variable el monto que se gano en el dia para enseñarlo en la vista
		@total_daily_sale = 0
		Sale.today.map {|a| @total_daily_sale = @total_daily_sale + a.monto}

		#dinero ingresado de las ventas hechas en 1 semana
		@total_weekly_sale = 0
		(Sale.today..Sale.today + 5).map! {|b| @total_weekly_sale = @total_weekly_sale + b.monto}
	end
end
