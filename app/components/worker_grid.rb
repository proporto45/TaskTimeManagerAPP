# Worker grid with some pre-configured columns
class WorkerGrid < Netzke::Basepack::Grid
  model "Worker"

  def configure(c)
    c.title = 'Workers'
    super
    c.model = 'Worker'
  end

  column :name do |c|
    c.width = 200
    c.flex = 1
  end

  column :email do |c|
    c.width = 200
  end

  column :created_at do |c|
    c.read_only = true
  end

  column :updated_at do |c|
    c.read_only = true
  end

  include Netzke::Yanit::Inspectable
end
