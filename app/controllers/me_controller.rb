class MeController < ApplicationController

  def show

    if session[:messages].present?
      @messages = session[:messages]
    else
      @messages = []
    end

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
