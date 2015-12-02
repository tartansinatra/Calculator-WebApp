require 'sinatra'
require 'sinatra/contrib/all' if development?
require 'pry-byebug'

# get '/multiply/:x/:y' do
#   @result = params[:x].to_f * params[:y].to_f
#   erb :result
# end

#####  BEAR IN MIND THAT THE :RESULT ON LINE 6 IS NOT FOR REFERENCING, MERELY A PLACEHOLDER (IT CAN BE WRITTEN AS ANYTHING##

get '/calculate' do
  @first = params[:first].to_f
  @second = params[:second].to_f
  @operator = params[:operator]

  @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
  end
  erb :result
end


get '/' do
  erb :home
end

get '/about' do
  erb :about_us
end

get '/contact_us' do
  @name = params[:name].to_s
  @email = params[:email].to_s
  @message = params[:message].to_s

  @reply = ""
    if @name || @email || @message == nil
    then
       "Sorry, please complete these three boxes."
    else 
      "Muchos gracias for the message. We'll get back to you once this box set finishes."
    end
  erb :message_reply
end

# get '/message_reply' do
#   erb :message_reply
# end