class ReglesController < ApplicationController
  def index
      log = Logement.find_by(id:params[:longement_id])
      regles= log.regles[0]
      render json:{
        regles:regles
      }

  end

  def upadte
    log = Logement.find_by(id:params[:longement_id])
    regles= log.regles
    regles.update(params_regele)
    condition= log.condition
    condition.update(conditions:params[:conditions])
  end
  private
  def params_regele
    params.require(:regle).permit(:arrive1,:arrive2,:depart1,:depart2)
  end
  
end
