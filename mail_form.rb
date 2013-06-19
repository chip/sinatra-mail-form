require 'sinatra/base'
require 'pony'
require 'yaml'

class MailForm < Sinatra::Base

  get '/test' do
    "/test route works fine"
  end

  post '/contact' do
    settings = YAML::load(File.open(File.expand_path("mail_form.yml")))

    Pony.mail to:      settings['recipient'],
	      cc:      'chip@chipcastle.com',
              from:    settings['no_reply'],
              subject: settings['subject'],
              body:    <<-EOT
      Parent Information:
      Name: #{params[:name]}
      Address: #{params[:address]}
      City: #{params[:city]}
      State: #{params[:state]}
      Zip: #{params[:zipcode]}
      Phone: #{params[:phone]}
      Email: #{params[:email]}

      Children:
      Name: #{params[:child1]}
      Date of Birth: #{params[:child1_dob]}
      Program of Interest: #{params[:program]}

      Name: #{params[:child2]}
      Date of Birth: #{params[:child2_dob]}
      Program of Interest: #{params[:program2]}

      What elementary school does your child attend?: #{params[:school]}
      How did you hear about us?: #{params[:referral]}
      Additional comments and/or questions: #{params[:comments]}
    EOT
    
    redirect to(settings['site'])
  end
end
