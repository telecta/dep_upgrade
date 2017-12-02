# frozen_string_literal: true

require "json"
require "date"

module DepUpgrade
  class Command
    attr_accessor :bundler_outdated_output, :bundler_audit_output,
      :yarn_outdated_output

    def call
      bundle_outdated
      yarn_outdated

      bundle_update
      bundle_audit_update
      bundle_audit
      yarn_upgrade

      print_summary
    end

    def system!(*args)
      system(*args) || abort("\n== Command #{args} failed ==")
    end

    def bundle_outdated
      puts "\n== Analyze outdated gems =="
      self.bundler_outdated_output = `bundle outdated --strict --parseable`
      puts "Done."
    end

    def yarn_outdated
      puts "\n== Analyze outdated yarn packages =="
      self.yarn_outdated_output = JSON.parse(`yarn outdated --json`.split("\n").last)
      puts "Done."
    end

    def bundle_update
      puts "\n== Update all gems =="
      system!("bundle update --all")
    end

    def bundle_audit_update
      puts "\n== Update gems advisory database =="
      system!("bundle exec bundle audit update")
    end

    def bundle_audit
      puts "\n== Audit all gems =="
      self.bundler_audit_output = `bundle exec bundle audit`.strip
      puts "Done."
    end

    def yarn_upgrade
      puts "\n== Update all yarn packages =="
      system!("yarn upgrade")
    end

    def print_summary
      puts "\nPaste this summary into your pull/merge request " \
        "(chore-dep_upgrade_#{Date.today.strftime("%Y%m%d")}):"
      puts "-----"

      puts "\n## Dep Upgrade #{Date.today}"

      print_bundle_update_summary
      print_bundle_audit_summary
      print_yarn_upgrade_summary
    end

    def print_bundle_update_summary
      puts "\nbundle update:"
      self.bundler_outdated_output
        .split("\n")
        .reject { |line| line.empty? }
        .map do |line|
          line.match(
            /(?<name>[^ ]+) \(newest (?<to>[^,]+), installed (?<from>[^),]+)/
          )&.named_captures
        end
        .compact
        .map do |gem|
          [
            "#{gem['name']} [(#{gem['from']} -> #{gem['to']})]",
            "(https://gemnasium.com/gems/#{gem['name']})"
          ].join
        end
        .each { |line| puts "* #{line}" }
    end

    def print_yarn_upgrade_summary
      puts "\nyarn upgrade:"
      self.yarn_outdated_output["data"]["body"]
        .select { |package| package[1] != package[2] } # Current != Wanted
        .map { |package| "#{package[0]} (#{package[1]} -> #{package[2]})" }
        .each { |line| puts "* #{line}" }
    end

    def print_bundle_audit_summary
      puts "\nbundle audit:"
      puts self.bundler_audit_output
    end
  end
end
