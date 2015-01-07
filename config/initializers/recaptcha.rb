Recaptcha.configure do |config|
  config.public_key  = "ENV['recaptcha_sitekey']"
  config.private_key = "ENV['recaptcha_secretkey']"
end
