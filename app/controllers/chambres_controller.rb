class ChambresController < ApplicationController
    before_action :authorized, only: [:auto_login]

    def index
        user = User.find(current_user.id)
        logement = Logement.find_by(id:params[:logement_id])
        chambres = logement.chambres
        salons = logement.salons
        autres = logement.autres

        chambre = Chambre.find_by(logement_id: params[:logement_id])
        lits = chambre.lits

        salon = Salon.find_by(logement_id: params[:logement_id])
        canapes = salon.canapes

        autre = Autre.find_by(logement_id: params[:logement_id])
        autrelits = autre.autrelits
        render json: {
            chambres:chambres,lits:lits,logement:logement,salons:salons,
            autres:autres,canapes:canapes,autrelits:autrelits} 
    end
    def create
       
        
        if params[:chambre] && (params[:chambre] != 0 || params[:chambre] != "0")
            fin = params[:chambre].to_i 
            
            for i in 0...fin
                chambre_id = Chambre.create(title:"chambre #{i+2}",logement_id:params[:logement_id])
                 
                method_name.each do |valu|
                    lits = Lit.create(name:valu,quantite:0,checked:false,chambre_id:chambre_id.id)
                end
            end
            
        end
    end
    private
    def method_name
      ["Lit Double","Lit Simple","Lit King-size","Lit Superposé","Canapé lit","Canapé lit double","Futon"]
    end
    
    
end
