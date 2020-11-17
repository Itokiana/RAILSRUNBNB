class EquiCourantsController < ApplicationController
      before_action :authorized, only: [:auto_login]

  # GET /equi_courants
  def index
  logement = Logement.find_by(id:params[:logement_id])
  equipement = logement.equi_courants[0].title
  tables = []
  o = 0
  for i in 0...3
    o+=1
    tables << equipement[(equipement.count - o)]
 end

     render json: {
      courant:equipement,
      tables:tables
    }
  end


  def update
    logement = Logement.find_by(id:params[:logement_id])
    equipement = logement.equi_courants[0]
    equipement.update(title:params[:title])

  end
    
end
