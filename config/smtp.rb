SMTP_SETTINGS = {
  :user_name => ENV["SENDGRID_USERNAME"],
  :password => ENV["SENDGRID_PASSWORD"],
  :domain => 'ozgunproje.org',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}

# if ENV["EMAIL_RECIPIENTS"].present?
#   Mail.register_interceptor RecipientInterceptor.new(ENV["EMAIL_RECIPIENTS"])
# end
