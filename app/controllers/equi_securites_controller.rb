class EquiSecuritesController < ApplicationController
    before_action :authorized, only: [:auto_login]
  # GET /equi_courants
  def index
  logement = Logement.find_by(id:params[:logement_id])
  equipement = logement.equi_securites[0].title
  equipements = logement.equi_securites[0]

     render json: {
      securites:equipement,
      fichier:equipements
    }
  end


  def update
    logement = Logement.find_by(id:params[:logement_id])
    equipement = logement.equi_securites[0]
    equipement.update(title:params[:title],Extincteur:params[:Extincteur],incendie:params[:incendie],gaz:params[:gaz],medicale:params[:medicale],Police:params[:Police])

  end
end
