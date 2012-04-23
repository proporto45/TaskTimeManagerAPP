# User grid with some pre-configured columns
class UserGrid < Netzke::Basepack::GridPanel
  model "User"

  override_column :name, width: 200, flex: 1
  override_column :email, width: 200
  override_column :actions, width: 20
  override_column :created_at, read_only: true
  override_column :updated_at, read_only: true

  include Netzke::Yanit::Inspectable
end
