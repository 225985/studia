Providers = YAML.load_file Rails.root.join 'config', 'providers.yml'

Rails.application.config.middleware.use OmniAuth::Builder do
  Providers.each do |name, keys|
    provider name, keys['key'], keys['secret']
  end
end

