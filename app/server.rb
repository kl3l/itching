require 'sinatra'
require 'dotenv/load'
require 'pony'

set :public_dir, Proc.new { File.join(root, "..", "public") }

class Application < Sinatra::Base
  configure do
    Pony.options = {
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'myapp.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    }
  end
end

get '/' do
  erb :index
end

get '/klel' do
  erb :klel
end

get '/mobileluv' do
  erb :mobileluv
end

get '/qz' do
  erb :qz
end

post '/qz' do
  Pony.mail(
    to: 'clare@no-mayo.co.uk',
    from: "Itching",
    subject: "itching email",
    :headers => { 'Content-Type' => 'text/html' },
    body: "<h2>from : #{params[:name]}</h2>" + "<br>" + "What you know bout me? #{params[:knowboutme]}" + "<br>" + "did you drive past clare on the m4? : " + params[:zone]
  )
  redirect '/'
end

get '/gif' do
  erb :gif
end