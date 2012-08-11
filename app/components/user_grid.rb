# User grid with some pre-configured columns
class UserGrid < Netzke::Basepack::GridPanel
  model "User"

  column :name do |c|
    c.width = 200
    c.flex = 1
  end

  column :email do |c|
    c.width = 200
  end

  column :actions do |c|
    c.width = 20
  end

  column :created_at do |c|
    c.read_only = true
  end

  column :updated_at do |c|
    c.read_only = true
  end

  include Netzke::Yanit::Inspectable
end
