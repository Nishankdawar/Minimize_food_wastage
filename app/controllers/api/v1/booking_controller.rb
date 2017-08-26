module Api
	module V1
		class BookingController < ::ApiController
			def showdata
				email = params[:email]
				organizer = Organizer.find_by_email email
				puts organizer.events.all
				return response_data({events: organizer.events.all}, "Success", 200)
			end

			# def minimum_distance
			# 	email = params[:email]
			# 	organizer = Organizer.find_by_email email

			# end
			
		end
	end
end