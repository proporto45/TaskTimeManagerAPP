# Our top-level Application component
class Application < Netzke::Basepack::Viewport
  include Netzke::Basepack::ItemsPersistence

  HEADER_HTML = "<b>Yanit</a> | RubyShift 2011 | <a href='http://github.com/nomadcoder/yanit'>Source code</a> | <a href='http://netzke.org'>netzke.org</a> | <a href='http://twitter.com/nomadcoder'>@nomadcoder</a></b>"

  js_configure do |c|
    c.layout = :border
    c.padding = 5
  end

  def configure(c)
    c.items = [
      # Top header
      {
        region: :north,
        height: 22,
        border: 0,
        body_style: 'background: transparent; text-align: right;',
        html: HEADER_HTML
      },
      :navigator,
      :workspace
    ]
    super
  end

  #
  # Component declarations
  #

  component :navigator do |c|
    c.klass = Navigator
    c.title = "Navigator"
    c.collapsible = true
    c.split = true
    c.width = 200
    c.region = :west
    c.workspace_id = [js_id, "workspace"].join("__")
  end

  component :workspace do |c|
    c.klass = Netzke::Communitypack::Workspace
    c.title = "Workspace"
    c.region = :center
    c.dashboard_config = dashboard_config
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
