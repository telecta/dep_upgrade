# frozen_string_literal: true

require "dep_upgrade"

namespace :dep do
  desc "Upgrade bundler and yarn dependencies"
  task :upgrade do
    DepUpgrade::Command.new.call
  end
end
