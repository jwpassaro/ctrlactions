class MeController < ApplicationController

  def show

    #call the method of send a message

    #send_awesome_text_message(params[:phone], params[:message])

    puts "sent message #{params[:message]} to #{params[:phone]}"

    #render(text: "yo")

    @message = params[:message]

  end
end
