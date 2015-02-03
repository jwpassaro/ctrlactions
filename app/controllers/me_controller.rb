class MeController < ApplicationController

  def show

    if session[:messages].present?
      @messages = session[:messages]
    else
      @messages = []
    end

    account_sid = 'AC4a20cae69e414568a87f0865f06b8601'
    auth_token = '09e18f4449711a906b1eed06d0d2d2db'

    @client = Twilio::REST::Client.new
    ('AC4a20cae69e414568a87f0865f06b8601',
    '09e18f4449711a906b1eed06d0d2d2db') #account_sid, auth_token

    @client.messages.create(
    from: '+17654055734',
    to: '+14438003292',
    body: params[:message]
    )

    #call the method of send a message

    #send_awesome_text_message(params[:phone], params[:message])
    if params[:message].present?

      puts "sent message #{params[:message]} to #{params[:phone]}"
      if session[:message_count].present?
        session[:message_count] = session[:message_count] + 1
      else
        session[:message_count] = 1
      end
      @messages.push(params[:message])

    end

    #session[:messages] = @messages
    @message = params[:message]

    @message_count = session[:message_count]

    end
  end

#byebug
