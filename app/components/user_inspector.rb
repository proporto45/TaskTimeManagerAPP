# A component used to inspect a spicific User. Has the user form on the top (using the UserForm component), and the IssueGrid on the bottom, which will display the issues assigned to the given user.
class UserInspector < Netzke::Basepack::BorderLayoutPanel

  def configuration
    super.tap do |c|
      c[:record_id] ||= User.first.id # handy for testing

      user = User.find(c[:record_id])

      c[:title] = user.name
      c[:items] = [
        {
          region: :north,
          height: 70,
          prevent_header: true,
          border: false,

          class_name: "UserForm",
          record_id: c[:record_id],
          read_only: true
        },

        {
          region: :center,
          title: "Issues assigned to #{user.name}",
          border: false,

          class_name: "IssueGrid",

          # we don't need the assignee__name column in this view
          override_columns: {
            assignee__name: {included: false}
          },

          # Make IssueGrid to only work with the issues for the inspected user
          strong_default_attrs: {assignee_id: c[:record_id]},
          scope: {assignee_id: c[:record_id]}
        }
      ]
    end
  end

  js_property :border, false
end