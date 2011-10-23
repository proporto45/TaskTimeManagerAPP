module Netzke
  module Yanit
    module Inspectable
      extend ActiveSupport::Concern

      included do |base|
        include Netzke::Basepack::ActionColumn

        column_action :inspect, :icon => "/images/icons/page_white_go.png"

        js_method :on_inspect, <<-JS
          function(record){
            var workspace = Ext.ComponentManager.get('application__workspace');
            workspace.loadChild("#{name.sub("Grid", "Inspector")}", {config: {record_id: record.get('id')}, newTab: true});
          }
        JS
      end
    end
  end
end