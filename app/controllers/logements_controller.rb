class LogementsController < ApplicationController
    before_action :authorized, only: [:auto_login]
    def index
        user = User.find(current_user.id)
        logement = user.logements
        indexa=[]
        adresses=[]
        photos=[]
                logement.each do |index|
                    indexa<<index
                    adresse = index.adresse
                    adresses << adresse
                    photos << index.photos[0]
                    end     
        
            render json: {
                        logement:indexa,
                        adresse:adresses,
                        photos:photos
                    }            
    end
    def show
        logement = Logement.find(params[:id])
        adresse = logement.adresse.adresse
        render json:{
            logement:logement,
            adresse:adresse
        }
        
    end
    
    
    def create
          puts '^^'*200
        logement= params[:hebergement]
        logement= JSON.parse(logement)
        @logement = Logement.new(name:logement["name"],types:logement["types"],categorie:logement["categorie"])
        @logement.user_id = current_user.id
        @logement.save
            
     
        @chambre = Chambre.create(title:"Chambre",logement_id: @logement.id)
        @salon = Salon.create(title: "Salon",logement_id: @logement.id)
        @autre = Autre.create(title: "Autre espace",logement_id: @logement.id)

        adresse= params[:localisation]
        adresse= JSON.parse(adresse)
        @adresse = Adresse.new(pays:adresse["pays"],ville:adresse["ville"],adresse:adresse["adresse"],code:adresse["code"])
        @adresse.logement_id = @logement.id
        @adresse.save


        
        #map controller new
        mape= params[:map]
        mape= JSON.parse(mape)
        @map = Map.new(longitude:mape["longitude"],latitude:mape["latitude"])
        @map.logement_id = @logement.id
        @map.save
    
        canapes = params[:canapes]
        canapes= JSON.parse(canapes)
        canapes.each do |canape|
            @lits = Canape.new(name:canape["name"],quantite:canape["quantite"],checked:canape["checked"])
            @lits.salon_id = @chambre.id
            @lits.save 
        end
        
    
        autres = params[:autres]
        autres= JSON.parse(autres)
        autres.each do |autre|
            @lits = Autrelit.new(name:autre["name"],quantite:autre["quantite"],checked:autre["checked"])
            @lits.autre_id = @chambre.id
            @lits.save 
        end
        
        # title = params[:title]
        # title= JSON.parse(title)
        # @equipement = Equipement.new(title:title["title"])
        # @equipement.logement_id=@logement.id
        # @equipement.save

        photos = params[:photo]
        photos.each do |photo|
            photo=Photo.new(photo:photo)
            photo.logement_id=@logement.id
            photo.save!
        end
    
        #regle controller new
        regles = params[:regles]
        regles= JSON.parse(regles)
        ParmsReservation.create(title:regles["regle"],autre:" ",logement_id:@logement.id)
         
        @regle = Regle.new(arrive1:regles["arrive1"],arrive2:regles["arrive2"],depart1:regles["depart1"],depart2:regles["depart2"])
        @regle.logement_id = @logement.id
        @regle.save
         
         #calendrier controller new
        dates = params[:date]
        dates= JSON.parse(dates)
        @cal = Calendrier.new(startDate:dates["startDate"],endDate:dates["endDate"])
        @cal.logement_id = @logement.id
        @cal.save
        
        #conditions controller new
        conditions = params[:conditions]
        conditions= JSON.parse(conditions)
        @condition = Condition.new(conditions:conditions["conditions"])
        @condition.logement_id = @logement.id
        @condition.save
        
        lits = params[:Lits]
        lits= JSON.parse(lits)
        puts lits
        lits.each do |lit|
               @lits = Lit.new(name:lit["name"],quantite:lit["quantite"],checked:lit["checked"])
               @lits.chambre_id = @chambre.id
               @lits.save     
        end
        title = params[:title]
        title= JSON.parse(title)
        EquiCourant.create(title:title["title"],logement_id: @logement.id)
        EquiFamille.create(title:title["title"],logement_id: @logement.id)
        EquiLogistique.create(title:title["title"],logement_id: @logement.id)
        EquiSecurite.create(title:title["title"],logement_id: @logement.id)
        EquiSuplementaire.create(title:title["title"],logement_id: @logement.id)
        AccesVoyageur.create(acces:" ",aide1:" ",aide2:" ",autre:" ",presentation:" ",transport:" ",logement_id:@logement.id)
        RessouceVoyageur.create(title:" ",logement_id:@logement.id)
        Caution.create(montant:"0 €",type_de_payment:"Carte bancaire",logement_id: @logement.id)
        render json:{
            lit:@lits,
            canape:@canape,
            autre:@autre
        }
          
    end

    def update
        log = Logement.find_by(id:params[:id])
        
        if log=log.update(name:params[:name],types:params[:types],categorie:params[:categorie],description:params[:description],unique:params[:unique])
            render json: {
                status: :log
            }
        else
           render json:{ 
               erreur: :error 
            } 
        end
        
    end
    

     private 

    # def logement_params
    #     params.require(:hebergement).permit(:name, :types, :categorie)
    # end
    # def adresse_params
    #     params.require(:localisation).permit(:pays, :ville, :adresse, :code)
    # end
    # # def params_equipement
    # #     params.require(:equipement).permit(title: [])
    # # end
    
    # def map_params
    #     params.require(:map).permit(:latitude, :longitude)
    # end
    # def condition_params
    #     params.require(:conditions).permit(:conditions)
    # end
    # def regle_params
    #     params.require(:regles).permit(:arrive1, :arrive2, :depart1, :depart2, regle: [])
    # end
    # def cal_params
    #     params.require(:date).permit( :startDate , :endDate)
    # end
end



