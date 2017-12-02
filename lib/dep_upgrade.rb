# frozen_string_literal: true

require "dep_upgrade/version"
require "dep_upgrade/command"

module DepUpgrade
  def self.load_tasks
    Dir[File.expand_path('tasks/*.rake', __dir__)].each { |ext| load ext }
  end

  require "dep_upgrade/railtie" if defined?(Rails) && Rails::VERSION::MAJOR >= 3
end
