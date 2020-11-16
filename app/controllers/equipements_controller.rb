class EquipementsController < ApplicationController
  def index
    logement = Logement.find(params[:logement_id])
    equipement = Equipement.find_by(logement_id:params[:logement_id])
    render json: {
      courant:equipement
    }
  end

  def create
  end

  def update
  end

  def delete
  end
end
