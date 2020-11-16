class ParmsReservationsController < ApplicationController
    before_action :authorized, only: [:auto_login]


   def index
  logement = Logement.find_by(id:params[:logement_id])
  reservartion = logement.parms_reservations[0]
     render json: {
      reservartion:reservartion
    }
  end


  def update
    logement = Logement.find_by(id:params[:logement_id])
    reservartion = logement.parms_reservations[0]
    reservartion.update(title:params[:title],autre:params[:autre])

  end

    
end
