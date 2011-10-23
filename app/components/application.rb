# Our top-level Application component
class Application < Netzke::Base
  js_base_class "Ext.container.Viewport"
  js_property :layout, :border
  js_property :padding, 5

  HEADER_HTML = "<b>Yanit</a> | RubyShift 2011 | <a href='http://github.com/skozlov/yanit'>Source code</a> | <a href='http://netzke.org'>netzke.org</a> | <a href='http://twitter.com/nomadcoder'>@nomadcoder</a></b>"

  items [
    # Top header
    {
      region: :north,
      height: 22,
      border: 0,
      body_style: 'background: transparent; text-align: right;',
      html: HEADER_HTML
    },

    # Navigator
    :navigator.component(region: :west, width: 200, split: true, collapsible: true, title: "Navigator"),

    # Workspace
    :workspace.component(region: :center, title: "Workspace")
  ]

  #
  # Component declarations
  #

  component :navigator do
    {
      class_name: "Navigator",
      workspace_id: [global_id, "workspace"].join("__")
    }
  end

  component :workspace do
    {
      class_name: "Netzke::Communitypack::Workspace",
      dashboard_config: dashboard_config
    }
  end

  private
    def dashboard_html
      %Q(
        <h1>Welcome to Yanit!</h1>
        <br>
        Currently in the system:<br>
        <b>#{User.count}</b> users<br>
        <b>#{Project.count}</b> projects<br>
        <b>#{Issue.count}</b> issues
      )
    end

    # Config for the initial tab in Workspace (the dashboard). Naturally, this can be any Netzke component.
    def dashboard_config
      {
        class_name: "Netzke::Basepack::Panel",
        title: "Dashboard",
        prevent_header: true,
        body_padding: 5,
        border: false,
        html: dashboard_html,
      }
    end

end