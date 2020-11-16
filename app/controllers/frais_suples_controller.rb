class FraisSuplesController < ApplicationController
    before_action :authorized, only: [:auto_login]

  # GET /frais_suples
  def index
    logement = Logement.find(params[:logement_id])
    
    if logement.frais_suples.present?  
        frais_suples = logement.frais_suples
       render json:{
         frais_suples:frais_suples
       }
    else
      render json:{
         ok: :"no"
       }
    end
  end

  def create
    frais_suple = FraisSuple.new(types:params[:types], montant:params[:montant], facturation:params[:facturation], logement_id:params[:logement_id])

    if frais_suple.save
      render json:{
        frais_suple:frais_suple
      }
    else
      render json:{
        frais_suple:frais_suple.errors,
         status: :unprocessable_entity
      }
    end
  end

  def delete
    frais_suple = FraisSuple.find(params[:id])
    frais_suple.delete
  end

end
