class EquiLogistiquesController < ApplicationController
   before_action :authorized, only: [:auto_login]
  # GET /equi_courants
  def index
  logement = Logement.find_by(id:params[:logement_id])
  equipement = logement.equi_logistiques[0].title
     render json: {
      logistiques:equipement
    }
  end


  def update
    logement = Logement.find_by(id:params[:logement_id])
    equipement = logement.equi_logistiques[0]
    equipement.update(title:params[:title])

  end
end
