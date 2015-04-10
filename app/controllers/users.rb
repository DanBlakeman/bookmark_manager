require 'rest_client'

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.create(
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id] = @user.id
    send_simple_message(@user.email)
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'users/new'
  end
end

def send_simple_message(email)
  RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
  "@api.mailgun.net/v3/#{ENV['MAILGUN_DOMAIN']}/messages",
  from: "Mayor of London <mailgun@#{ENV['MAILGUN_DOMAIN']}>",
  to: "#{email}, #{email}",
  subject: 'UKIP for London. Take a stand in the General Election 2015',
  text: 'Dear London resident, on May 7, 2015 the long-awaited general election will take place. You know what to do.'
end