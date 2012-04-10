# A rather complex component that allows working with a given project.
# Consists of a simple statistics HTML on top. Followed with UserIssueExplorer in the middle, that displays all all issues of this project per user. And finally - an issue grid with all issues for this project on the top.
class ProjectInspector < Netzke::Basepack::BorderLayoutPanel
  def configure
    super
    config.record_id ||= Project.first.try(:id) # handy for testing

    project = Project.find(config.record_id)

    # Set title to the current project's name
    config.title = project.name

    # Specify regions for our base class, BorderLayoutPanel
    config.items = [
      # In the "north" we'll have a little HTML window with statistics
      {
        region: :north,
        height: 50,
        prevent_header: true,
        body_padding: 5,
        html: info_html(project)
      },

      # In the "center" we'll have the UserIssueExplorer for the users involved in the
      {
        region: :center,
        class_name: "UserIssueExplorer",

        # Configure the UserIssueExplorer to only work with data related to the current project
        container_config: {
          title: "People involved",
          class_name: "UserGrid",
          scope: lambda { |rel| rel.assignees_for_project(project) },
          columns: [{name: :name, flex: 1}, {name: :email, flex: 1}, {name: :actions, width: 20}],
          bbar: []
        },

        collection_config: {
          class_name: "IssueGrid",
          scope: {project_id: project.id},
          strong_default_attrs: {project_id: project.id},

          # we only need the following columns
          columns: [:name, {name: :description, flex: 1}, :priority, :status, :started_on, :due_on, {name: :actions, width: 20}],
          bbar: [:add_in_form.action, :edit_in_form.action, :apply.action, "-", :del.action]
        }
      },

      # In the "south" - all the issues from this project
      {
        region: :south,
        height: 300,
        split: true,
        title: "All issues for #{project.name}",
        class_name: "IssueGrid",
        scope: {project_id: project.id},
        strong_default_attrs: {project_id: project.id},
        columns: [:name, :description, :priority, :status, :assignee__name, :started_on, :due_on, {name: :actions, width: 20}]
      }
    ]
  end

  # Simple HTML with statistics on this project
  def info_html(project)
    %Q{
      <b>Issues:</b> #{project.issues.count} total, #{project.issues.open_or_new.count} open
      <br>
      <b>Assignees:</b> #{project.assignees.count}
    }
  end
end
