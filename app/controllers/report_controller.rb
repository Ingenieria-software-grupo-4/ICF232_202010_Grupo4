class ReportController < ApplicationController
	def metodorep
		#toma las ultimos 10 codigos de ventas de usuario
		@user_day_sales = Sale.where(:us => current_user.id)

		
		@p = Product.where(:id_usuario => current_user.id )
		#ahora en una variable recorremos los productos vendidos de las 10 ultimas ventas
		#necesito saber si sobre escribo o añado datos al array
		arr_prod = []
		@user_day_sales.each do |j|

			partial_prod = j.productos #variable temporal de guardado de array

			arr_prod  << partial_prod.split

			partial_prod = nil #vaciamos la variable parcial para evitar cualquier error

		end
		#una vez terminado el proceso paramos a guardar en otra variable las ventas para mostrarlas en la vista
		if arr_prod != nil
			@arr_prod.each do |n|
				@prod_to_see = Product.where(:codigo => n)
			end
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
