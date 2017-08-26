module Api
	module V1
		class RegistrationController < ::ApiController
			
			def loginOrganizer
				email = params[:email]
				password = params[:password]
				organizer = Organizer.find_by_email email
				puts "organizer",organizer,"organizer"
				unless organizer
					return response_data({}, "User not present", 201)
				end

				unless organizer.password == password
					return response_data({}, "Wrong Password", 201)
				end
				puts organizer.events
				return response_data({email: email, events: organizer.events}, "Success", 200)
			end

			def loginOrphanage
				email = params[:email]
				password = params[:password]
				orphanage = Orphanage.find_by_email(email)
				unless orphanage
					return response_data({}, "User not present", 201)
				end

				unless orphanage.password == password
					return response_data({}, "Wrong Password", 201)
				end

				return response_data({}, "Success", 200)				
			end

			def createOrphanage
				name_Orphanage = params[:name]
				email = params[:email]
				password = params[:password]
				no_of_children = params[:no_of_children]
				lat_orphanage = params[:lat]
				lng_orphanage = params[:lng]
				phone_number = params[:phone_number]
				if Orphanage.find_by_email email 
					return response_data({}, "User already present", 201)
				end
				Orphanage.create(phone_number: phone_number,name: name_Orphanage, no_of_children: no_of_children,lng: lng_orphanage, lat: lat_orphanage, password: password, email: email)
				return response_data({}, "Orphanage created", 200)
			end

			def createOrganizer
				name_organizer = params[:name]
				lat_organizer = params[:lat]
				lng_organizer = params[:lng]
				phone_number = params[:phone]
				email = params[:email]
				puts "email",email,"email"
				password = params[:password]
				if Organizer.find_by_email(email)
					return response_data({}, "User already present", 201)
				end	
				Organizer.create(name: name_organizer,email: email,  lat: lat_organizer, lng: lng_organizer, phone_number: phone_number, password: password)
				return response_data({email: email}, "Organizer created", 200)
			end



			def createEvent
				name_event = params[:name]
				start_time = params[:start]
				end_time = params[:end]
				no_of_people = params[:people]
				email = params[:email]
				organizer_id = Organizer.find_by_email email 
				unless organizer_id
					return response_data({}, "User not present", 201)
				end
				Event.create(name: name_event, start_time: start_time, end_time: end_time, no_of_people: no_of_people, organizer_id: organizer_id.id, status: 'pending')
				return response_data({}, "Pending", 200)
			end

		end
	end
end