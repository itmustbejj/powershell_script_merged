require 'chef/provider/powershell_script'

class Chef
  class Provider
    class PowershellScriptMergedFlags < Chef::Provider::PowershellScript

      provides :powershell_script

      def flags
        interpreter_flags = default_interpreter_flags.map do |x|
          [x.split[0], x.split[1] || ""] }.to_h
        end

        if ! (new_resource.flags.nil?)
          custom_flags = new_resource.flags.split(',').map do |x|
            [x.split[0], x.split[1] || ""] }.to_h
          end

          interpreter_flags.merge!(custom_flags).to_a.map do |x,y|
            y.empty? ? "#{x} " : "#{x} #{y} "}.join.strip
          end
        end

        interpreter_flags
      end
    end
  end
end
