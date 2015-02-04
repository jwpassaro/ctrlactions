class MeController < ApplicationController

  def show
    if session[:messages].blank?
      session[:messages] = []
    end
    if session[:message_count].blank?
      session[:message_count] = 0
    end

    if params[:message].present?
      # must have in gemfile & bundle: gem 'twilio-ruby', '~> 3.12'
      client = Twilio::REST::Client.new(
      'AC4a20cae69e414568a87f0865f06b8601', # sid
      '09e18f4449711a906b1eed06d0d2d2db') # auth token

      client.messages.create(
      from: '+17654055734', # put your twilio outgoing number here
      to: "+1#{params[:phone]}", # assumes 10 digits, no dashes or spaces
      body: params[:message]
      )

      puts "sent message #{params[:message]} to #{params[:phone]}"

      session[:message_count] = session[:message_count] + 1
      session[:messages].push(params[:message])
    end
  end
end

  #
  #   @client = Twilio::REST::Client.new (
  #   'AC4a20cae69e414568a87f0865f06b8601',
  #   '09e18f4449711a906b1eed06d0d2d2db') #account_sid, auth_token
  #
  #   @client.messages.create(
  #   from: '+17654055734',
  #   to: '+14438003292',
  #   body: params[:messages]
  #   )
  #
  #   #call the method of send a message
  #
  #   #send_awesome_text_message(params[:phone], params[:message])
  #   if params[:message].present?
  #
  #     puts "sent message #{params[:message]} to #{params[:phone]}"
  #     if session[:message_count].present?
  #       session[:message_count] = session[:message_count] + 1
  #     else
  #       session[:message_count] = 1
  #     end
  #     @messages.push(params[:message])
  #
  #   end
  #
  #   #session[:messages] = @messages
  #   @message = params[:message]
  #
  #   @message_count = session[:message_count]
  #
  #   end
  # end

#byebug
