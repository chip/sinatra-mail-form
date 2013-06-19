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
      Name:     #{params[:name]}
      Address:  #{params[:address]}
      City:     #{params[:city]}
      State:    #{params[:state]}
      Zip:      #{params[:zipcode]}
      Phone:    #{params[:phone]}
      Email:    #{params[:email]}
      Child:    #{params[:child1]}     Date of Birth: #{params[:child1_dob]}
      Child:    #{params[:child2]}     Date of Birth: #{params[:child2_dob]}
      Program of Interest:                            #{params[:program]}
      What elementary school does your child attend?: #{params[:school]}
      How did you hear about us?:                     #{params[:referral]}
    EOT
    
    redirect to(settings['site'])
  end
end
