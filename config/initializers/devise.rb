
Devise.setup do |config|

  config.mailer_sender = 'Brock @ Creator Arcade <no-reply@creatorarcade.com>'


  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  require 'omniauth-google-oauth2'
  config.omniauth :google_oauth2, '572230130618-9r03c6gpa666d1v2moilm7go5f33jqh9.apps.googleusercontent.com', 'XYZn3KtDTkdCFI2eidNwZc05', {access_type: "offline", approval_prompt: ""}

  require 'omniauth-facebook'
  config.omniauth :facebook, "1834673600120000", "d6c94358971e30af126a76c980c705f4", scope: 'email', info_fields: 'email,name'
end
