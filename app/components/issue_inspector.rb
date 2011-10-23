# Component used to inspect a given Issue. It contains a form on the top, and the assignee details on the bottom.
class IssueInspector < Netzke::Basepack::BorderLayoutPanel

  def configuration
    super.tap do |c|
      c[:record_id] ||= Issue.first.id # default record id, handy for debugging

      issue = Issue.find(c[:record_id])

      # Dynamically setting the title
      c[:title] = issue.name

      c[:items] = [
        {
          region: :north,
          height: 210,
          prevent_header: true,
          class_name: "IssueForm",
          model: "Issue",
          record_id: c[:record_id],
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

end