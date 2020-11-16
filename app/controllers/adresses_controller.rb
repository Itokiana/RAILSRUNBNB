class AdressesController < ApplicationController
      before_action :authorized, only: [:auto_login]

 
  def update
    log = Logement.find_by(id:params[:longement_id])
    adresse= log.adresse
    
      if     @adresse = adresse.update(pays:params[:pays],ville:params[:ville],adresse:params[:adresse],code:params[:code])
          render json:{
            adresse:@adresse
          }
      
      else
        
      end
        
  end

  def delete
  end
 
  
end
