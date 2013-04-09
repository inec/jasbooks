
Devise.setup do |config|

  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"


  require 'devise/orm/active_record'


  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]



 


  config.stretches = Rails.env.test? ? 1 : 10

  # Setup a pepper to generate the encrypted password.
  # config.pepper = "0ad90819681fa665c1ea0f59e58edba794832ffa6384109caabc9aed8bce4d73484d37ef4f534a8f48263d0494749963120440f53395759af51ccaae09629fa8"



  config.reconfirmable = true


  config.password_length = 6..128




  config.reset_password_within = 6.hours

  config.sign_out_via = :delete


end
