TEMPLATE = {
  "template": {
    "title": "2023 Craft Certificate",
    "category": "certificates",
    "page_size": "400 900",
    "type": "certificate",
    "color": "FFFFFF",
  },

  "defaults": {
    "font_family": "Times-Roman",
    "font_size": "12pt",
  },

  "sections": {
    "header1": {
      "font_size": "20pt",
      "location": "70 360 400 30",
      "text": "NCCER Presents",
      "style": "italic",
    },
    "header2": {
      "font_size": "20pt",
      "location": "240 360 400 70",
      "text": "2023 Craft Certificate",
      "style": "italic",
    },
    "name": {
      "font_size": "40pt",
      "font_style": "italic",
      "location": "160 280 400 110",
      "text": "{{name}}",
      "style": "italic",
    },

    "presented-header": {
      "location": "150 150 90 220",
      "text": "Presented On",
    },
    "presented-date": {
      "location": "140 130 120 250",
      "text": "{{completion_date}}",
    },

    "signature": {
      "location": "450 150 125 120",
      "image": "images/certificates/boyd_signature.png",
    },
  },
}

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
    hash = { name: params["info"]["name"], template: { category: params["info"]["type"] }, completion_date: params["info"]["date_completed"] }
    #render json: hash
    renderer = Renderer.new(TEMPLATE, hash)
    renderer.begin
    # pdf = Prawn::Document.new
    # pdf.text "Hello World"
    # send_data pdf.render, :filename => "x.pdf", :type => "application/pdf"
    send_data renderer.pdf.render, :filename => "x.pdf", :type => "application/pdf", :disposition => "inline"
  end
end
