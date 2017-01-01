module Unidom
  module Category

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Category

      enable_initializer enum_enabled: false, migration_enabled: true

    end

  end
end
