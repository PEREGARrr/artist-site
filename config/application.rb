require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Site
  class Application < Rails::Application
    config.sass.preferred_syntax = :sass

    config.generators do |g|
      g.javascripts false
      g.scaffold_stylesheet false
      g.stylesheets false
      g.template_engine :slim
      g.test_framework :rspec
      
    config.assets.version = '1.0'
    
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'aws_var.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
    
    end
  end
end

    