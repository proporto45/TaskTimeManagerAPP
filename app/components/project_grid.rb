# Our customized project grid
class ProjectGrid < Netzke::Basepack::GridPanel
  model "Project"

  # columns customizations (these are optional)
  override_column :name, flex: 1
  override_column :description, flex: 1
  override_column :actions, width: 20
  override_column :created_at, read_only: true
  override_column :updated_at, read_only: true

  # The inspect action (and column)
  include Netzke::Yanit::Inspectable
end