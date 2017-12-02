# frozen_string_literal: true

module DepUpgrade
  class Railtie < Rails::Railtie
    rake_tasks do
      DepUpgrade.load_tasks
    end
  end
end
