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

  def delete

    #Parameters: {"toast_id"=>"777"}

    the_id = params.fetch("toast_id")
    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)
    the_photo.destroy

    #render({ :template => "photos_templates/delete.html.erb" })

    redirect_to("/photos")
  end

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    #render({ :template => "photos_templates/create.html.erb"})

    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update

    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.at(0)  
    
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    #render({ :template => "photos_templates/update.html.erb"})

    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def comment

    input_photo_id = params.fetch("photo_id")
    input_author_id = params.fetch("author_id")
    input_author_comment = params.fetch("author_comment")

    matching_photos = Photo.where({ :id => input_photo_id })
    the_photo = matching_photos.at(0)

    a_new_comment = Comment.new
    a_new_comment.photo_id = input_photo_id
    a_new_comment.author_id = input_author_id
    a_new_comment.body = input_author_comment

    a_new_comment.save
    
    
    #render({ :template => "photos_templates/comment.html.erb"})
    redirect_to("/photos/" + the_photo.id.to_s)
  end

end
