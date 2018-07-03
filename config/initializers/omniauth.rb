Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_oauth2, ''ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"]
  provider :google_oauth2, '1093109798228-p49f4oltri55vp94ntotj37fns88up6p.apps.googleusercontent.com', 'PU-XaRWEWQOhHCJuEivgH80M',  {
                             :scope => "userinfo.email, userinfo.profile"
                         }

end
