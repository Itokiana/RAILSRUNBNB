class RessouceVoyageursController < ApplicationController
    before_action :authorized, only: [:auto_login]

  # GET /ressouce_voyageurs
    def index
      logement = Logement.find(params[:logement_id])
      ressources = logement.ressouce_voyageurs[0]
      render json:{
        ressources:ressources
      }
    end

    def update
      logement = Logement.find(params[:logement_id])
      ressources = logement.ressouce_voyageurs[0]
       ressources.update(title:params[:ressources])
    end
end
