require 'net/http'

class EmailsCheckController < ApplicationController

  def index

  end

  def check_mail
    uri = URI('http://apilayer.net/api/check')
    email = params[:email]
    params = {
        :access_key => '1288ec1307728addc73ab092c160bfde',
        :email => email
    }

    uri.query = URI.encode_www_form(params)
    @res = Net::HTTP.get_response(uri).body

  end

  def show
    @res.body
  end

end
