module Netzke
  module Yanit
    module Inspectable
      extend ActiveSupport::Concern

      included do |base|
        include Netzke::Basepack::ActionColumn

        column :inspect do |c|
          c.type = :action
          c.actions = [{name: :inspect, icon: :arrow_right}]
          c.width = 20
          c.text = ""
        end

        js_configure do |c|
          c.on_inspect = <<-JS
            function(record){
              var workspace = Ext.ComponentManager.get('application__workspace');
              workspace.loadInTab("#{name.sub("Grid", "Inspector")}", {config: {record_id: record.get('id')}, newTab: true});
            }
          JS
        end
      end
    end
  end
end
