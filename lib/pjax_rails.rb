require 'pjax'

module PjaxRails
  class Engine < ::Rails::Engine
    config.pjax_rails = ActiveSupport::OrderedOptions.new


    initializer "pjax_rails.set_configs" do |app|
      options                           =app.config.pjax_rails
      options.default_pjax_container ||= "[data-pjax-container]"

      config.to_prepare do 
        ApplicationController.send :include, Pjax 
        options.each { |k,v| ApplicationController.send("#{k}=", v) }
      end
    end

    initializer "pjax_rails.compile_config_methods" do
      ActiveSupport.on_load(:pjax_rails) do
        config.compile_methods! if config.respond_to?(:compile_methods!)
      end
    end

  end
end