class AccesVoyageursController < ApplicationController
      before_action :authorized, only: [:auto_login]

  # GET /acces_voyageurs
  def index
      logement = Logement.find_by(id:params[:logement_id])
      equipement = logement.acces_voyageurs[0]
     
      render json: {
        acces:equipement
      }
  end

 



  def update
    logement = Logement.find_by(id:params[:logement_id])
    equipement = logement.acces_voyageurs[0]
    if equipement.update(acces:params[:acces],aide1:params[:aide1],aide2:params[:aide2],autre:params[:autre],presentation:params[:presentation],transport:params[:transport])
      render json:{
        aces:equipement
      }
    else
      render json: {error:equipement.errors, status: :unprocessable_entity}
    end
  end

end
