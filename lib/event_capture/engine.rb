# frozen_string_literal: true
module EventCapture
  # Mountable engine with isolated namespace.
  class Engine < ::Rails::Engine
    isolate_namespace EventCapture

    config.generators do |g|
      g.test_framework :rspec
      g.assets false
      g.helper false
    end
  end
end
