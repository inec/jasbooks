
Devise.setup do |config|
  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class with default "from" parameter.
  config.mailer_sender = "please-change-me-at-config-initializers-devise@example.com"


  # available as additional gems.
  require 'devise/orm/active_record'


  config.case_insensitive_keys = [ :email ]

  # Configure which authentication keys should have whitespace stripped.
  # These keys will have whitespace before and after removed upon creating or
  # modifying a user and when used to authenticate or find a user. Default is :email.
  config.strip_whitespace_keys = [ :email ]

  

  config.skip_session_storage = [:http_auth]

 
  # a value less than 10 in other environments.
  config.stretches = Rails.env.test? ? 1 : 10


  config.reconfirmable = true


  config.password_length = 6..128

  # Email regex used to validate email formats. It simply asserts that
  
  config.reset_password_within = 6.hours

 
  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete

 
end
