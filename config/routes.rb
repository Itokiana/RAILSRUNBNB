Rails.application.routes.draw do
 
  resources :conversations
  resources :messages
  get 'regles/index'
  get 'regles/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only:[:show,:create,:update,]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  resources :logements do
  resources :chambres, only:[:index,:upadate,:create]
  resources :photos
    end
  put '/logements/:logement_id/equi_courants/',to:"equi_courants#update"
  get '/logements/:logement_id/equi_courants/',to:"equi_courants#index"

  put '/logements/:logement_id/cautions/',to:"cautions#update"
  get '/logements/:logement_id/cautions/',to:"cautions#index"

  get '/logements/:logement_id/frais_suples/',to:"frais_suples#index"
  post '/logements/:logement_id/frais_suples/',to:"frais_suples#create"
  delete '/frais_suples/:id',to:"frais_suples#delete"

  put '/logements/:logement_id/acces_voyageurs/',to:"acces_voyageurs#update"
  get '/logements/:logement_id/acces_voyageurs/',to:"acces_voyageurs#index"

  put '/logements/:logement_id/ressouce_voyageurs/',to:"ressouce_voyageurs#update"
  get '/logements/:logement_id/ressouce_voyageurs/',to:"ressouce_voyageurs#index"

  put '/logements/:logement_id/parms_reservations/',to:"parms_reservations#update"
  get '/logements/:logement_id/parms_reservations/',to:"parms_reservations#index"
  
  
  put '/logements/:logement_id/equi_familles/',to:"equi_familles#update"
  get '/logements/:logement_id/equi_familles/',to:"equi_familles#index"
  
  put '/logements/:logement_id/equi_logistiques/',to:"equi_logistiques#update"
  get '/logements/:logement_id/equi_logistiques/',to:"equi_logistiques#index"
  
  put '/logements/:logement_id/equi_securites/',to:"equi_securites#update"
  get '/logements/:logement_id/equi_securites/',to:"equi_securites#index"
  
  put '/logements/:logement_id/equi_suplementaires/',to:"equi_suplementaires#update"
  get '/logements/:logement_id/equi_suplementaires/',to:"equi_suplementaires#index"

  get '/logements/:logement_id/adresses',to:"adresses#show"
  put "/logements/:longement_id/adresse",to:"adresses#update"
  
  put "/avatar",to:"avatars#create"
  
  put '/logements/:longement_id/map',to:"maps#update"

  put '/logements/:longement_id/conditions',to:"conditions#upadte"
  get '/logements/:longement_id/conditions',to:"conditions#index"

  put '/logements/:longement_id/regles',to:"regles#upadte"
  get '/logements/:longement_id/regles',to:"regles#index"
  
end
