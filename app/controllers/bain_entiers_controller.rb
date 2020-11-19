class BainEntiersController < ApplicationController
    def index
        user = User.find(current_user.id)
        logement = Logement.find_by(id:params[:logement_id])
        bain_demi = BainDemi.find_by(logement_id: params[:logement_id])
        bain_entier = BainEntier.find_by(logement_id: params[:logement_id])
        cuisine = Cuisine.find_by(logement_id: params[:logement_id])
        kit= Kitchenette.find_by(logement_id: params[:logement_id])

        puts "*"*100
            puts bain_demi
            puts "*"*100
        render json:{
            bain_demi:bain_demi, bain_entier:bain_entier, cuisine:cuisine, kit:kit
        }
    end
end
