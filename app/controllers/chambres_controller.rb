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

        bain_entier = BainEntier.create(title:"Salle de bain entière : Toilette, lavabo, douce et baignoire
                        ",quantite: params[:quantite],logement_id: params[:logement_id])
        bain_demi = BainDemi.create(title:"Demi-salle de bain : Toilette et lavabo
                     ",quantite: params[:quantite],logement_id: params[:logement_id])
         cuisine = Cuisine.create(title:"Cuisine entière
                    ",quantite: params[:quantite],logement_id: params[:logement_id])
         kitchenette = Kitchenette.create(title:"Kitchenette : un espace compact pour préparer à manger
                        ",quantite: params[:quantite],logement_id: params[:logement_id])
        
        if params[:chambre] && (params[:chambre] != 0 || params[:chambre] != "0")
            fin = params[:chambre].to_i 
            
            for i in 0...fin
                chambre_id = Chambre.create(title:"chambre #{i+2}",logement_id:params[:logement_id])
                 
                method_name.each do |valu|
                    lits = Lit.create(name:valu,quantite:0,checked:false,chambre_id:chambre_id.id)
                end
            end
            
        end

        if params[:salon] && (params[:salon] != 0 || params[:salon] != "0")
                fin = params[:salon].to_i 
                
                for i in 0...fin
                    salon_id = Salon.create(title:"salon #{i+2}",logement_id:params[:logement_id])
                    
                    salon.each do |valu|
                        canapes = Canape.create(name:valu,quantite:0,checked:false,chambre_id:salon_id.id)
                    end
                end
                
            end
   end

   def update
    @bain_entier = BainEntier.find_by(logement_id: params[:logement_id])
    if params[:bain_entier]
        @bain_entier.update(quantite: params[:bain_entier])
                             
    end
    @bain_demi = BainDemi.find_by(logement_id: params[:logement_id])
    if params[:bain_demi]
        @bain_demi.update(quantite: params[:bain_demi])
                             
    end
    @cuisine = Cuisine.find_by(logement_id: params[:logement_id])
    if params[:cuisine]
        @cuisine.update(quantite: params[:cuisine])
                             
    end

    @Kit= Kitchenette.find_by(logement_id: params[:logement_id])
    if params[:kitchenette]
        @Kit.update(quantite: params[:kitchenette])
                             
    end

   end

    private
    def method_name
      ["Lit Double","Lit Simple","Lit King-size","Lit Superposé","Canapé lit","Canapé lit double","Futon"]
    end
    def salon
        ["Canapés","Canapés lits
            "]
    end
end
