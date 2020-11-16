class ConditionsController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def index
      log = Logement.find_by(id:params[:longement_id])
      condition= log.condition
      render json:{
        condition:condition
      }

  end

  def upadte
    log = Logement.find_by(id:params[:longement_id])
    condition= log.condition
    condition.update(conditions:params[:conditions])
      
  end
end
