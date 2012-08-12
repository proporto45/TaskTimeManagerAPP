# This issue grid is used across multiple views
class IssueGrid < Netzke::Basepack::GridPanel
  model "Issue"

  # columns customizations (these are optional)
  column :description do |c|
    c.flex = 1
  end

  column :status do |c|
    c.editor = {xtype: :combobox, store: Issue::STATUSES}
    c.width = 60
  end

  column :priority do |c|
    c.width = 50
  end

  column :created_at do |c|
    c.hidden = true
  end

  column :updated_at do |c|
    c.hidden = true
  end

  column :actions do |c|
    c.width = 20
  end

  # The inspect action (and column)
  include Netzke::Yanit::Inspectable

  # Use our custom IssueForm for Add/Edit forms
  add_form_config         class_name: "IssueForm"
  edit_form_config        class_name: "IssueForm"
  multi_edit_form_config  class_name: "IssueForm"

  # Increase size of form windows
  add_form_window_config        width: 600
  edit_form_window_config       width: 600
  multi_edit_form_window_config width: 600
end
