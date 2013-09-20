# Our top-level Application component
class Application < Netzke::Basepack::Viewport
  include Netzke::Basepack::ItemPersistence

  HEADER_HTML = "<b>Task Time Manager</b>"

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
  #component :login do |c|
  #  c.region = :north
 # end
  
  component :navigator do |c|
    c.klass = Navigator
    c.title = "Menu"
    c.collapsible = true
    c.split = true
    c.width = 200
    c.region = :west
    c.workspace_id = [js_id, "workspace"].join("__")
  end

  component :workspace do |c|
    c.region = :center
  end
end
