require 'inspec/control_eval_context'
require 'inspec/rule'

gcp_project_id='simonfisher-183117'

module ::Inspec
  class ContentCache
    class << self
      def cache(name, data)
        instance_variable_set("@#{name}", data)
        ::Inspec::ControlEvalContext.define_method(name.to_sym) do
          ::Inspec::ContentCache.send(name.to_sym)
        end
        ::Inspec::Rule.define_method(name.to_sym) do
          ::Inspec::ContentCache.send(name.to_sym)
        end
        define_singleton_method(name.to_sym) do
          instance_variable_get("@#{name}")
        end
      end
    end
  end
end

::Inspec::ContentCache.cache('cache_google_project', google_project(project: gcp_project_id))

