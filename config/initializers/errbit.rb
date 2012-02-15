if defined?(HoptoadNotifier)
  HoptoadNotifier.configure do |config|
    config.api_key     = '5746af7bfe551fdc7322decb002980e8'
    config.host        = 'errcamping.herokuapp.com'
    config.port        = 80
    config.secure      = config.port == 443
  end
end
