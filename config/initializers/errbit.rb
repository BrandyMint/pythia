if defined? Airbrake
   Airbrake.configure do |config|
      config.api_key		 	= '773b5246687219e332a80a638a4b3643'
      config.host			= 'errbit.brandymint.ru'
      config.port			= 80
      config.secure			= config.port == 443
   end
end
