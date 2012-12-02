class Workspace < Netzke::Communitypack::Workspace
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

  component :dashboard do |c|
    super c
    c.body_padding = 5
    c.html = dashboard_html
  end
end
