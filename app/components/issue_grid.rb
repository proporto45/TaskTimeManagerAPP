# This issue grid is used across multiple views
class IssueGrid < Netzke::Basepack::GridPanel
  model "Issue"

  # columns customizations (these are optional)
  override_column :description, flex: 1
  override_column :status, editor: {xtype: :combobox, store: Issue::STATUSES}, width: 60
  override_column :priority, width: 50
  override_column :created_at, hidden: true
  override_column :updated_at, hidden: true
  override_column :actions, width: 20

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