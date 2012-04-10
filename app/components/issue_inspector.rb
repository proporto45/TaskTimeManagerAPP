# Component used to inspect a given Issue. It contains a form on the top, and the assignee details on the bottom.
class IssueInspector < Netzke::Basepack::BorderLayoutPanel

  def configure
    super
    config.record_id ||= Issue.first.id # default record id, handy for debugging

    issue = Issue.find(config.record_id)

    # Dynamically setting the title
    config.title = issue.name

    config.items = [
      {
        region: :north,
        height: 210,
        prevent_header: true,
        class_name: "IssueForm",
        model: "Issue",
        record_id: config.record_id,
        read_only: true
      },

      {
        region: :center,
        title: "Assignee details",
        class_name: "UserForm",
        record_id: issue.assignee.id,
        read_only: true
      }
    ]
  end

end
