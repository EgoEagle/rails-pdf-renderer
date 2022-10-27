class HomeController < ApplicationController
  protect_from_forgery with: :null_session

  def index

    #render json: params
    # file_field is a StringIO object
    #file_field.content_type # 'text/csv'
    #file_field.full_original_filename
  end

  def submit
    #file_field = @params["form"]["file"] rescue nil
    hash = { info: { name: params["info"]["name"] } }
    render json: hash
    puts "A"
  end
end
