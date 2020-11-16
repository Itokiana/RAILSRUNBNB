class PhotosController < ApplicationController
  before_action :authorized, only: [:auto_login]


  # GET /photos
  def index
  logement = Logement.find_by(id:params[:logement_id])
  photos = logement.photos   
  render json:{
    photo:photos
  } 

    
  end

  # GET /photos/1
  def show
    logement = Logement.find_by(id:params[:logement_id])
    images = logement.photos
    
    photo  = Photo.find(params[:id])
    rang = 0
    tout = images.count

    images.all.each do |image|     
       rang+=1
       break if (image.id ===  params[:id].to_i)
    end
     
    
    render json:{
      photo:photo,
      rang:rang,
      tout:tout
    }
    
  end

  # POST /photos
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      render json: @photo, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  def update
    photo  = Photo.find(params[:id])

    if params[:photo] === "null" 
            photo.update(legend:params[:legend])

      render json:{
        photo:photo
      }
    else
      photo.update(photo:params[:photo],legend:params[:legend])
      render json:{
        photo:photo
      }
    end
  end

  # DELETE /photos/1
  def destroy
      photo  = Photo.find(params[:id])
      photo.destroy
  end

end
