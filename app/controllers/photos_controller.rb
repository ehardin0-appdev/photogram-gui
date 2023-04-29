class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "photos_templates/index.html.erb" })
  end

  def show
    url_photo = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_photo })

    @the_photo = matching_photos.at(0)
    render({ :template => "photos_templates/show.html.erb" })
  end
end
