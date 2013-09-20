# A component used to inspect a spicific Worker. Has the worker form on the top (using the WorkerForm component), and the IssueGrid on the bottom, which will display the issues assigned to the given worker.
class WorkerInspector < Netzke::Base
  attr_accessor :worker

  def configure(c)
    super

    c.record_id ||= Worker.first.id # handy for testing

    self.worker = Worker.find(c.record_id)

    c.title = worker.name

    c.items = [ :worker_form, :worker_issues ]
  end

  component :worker_form do |c|
    c.record_id = config.record_id
    c.region = :north
    c.height = 85
    c.border = false
    c.klass = WorkerForm
    c.read_only = true
  end

  component :worker_issues do |c|
    c.region = :center
    c.title = "Tasks assigned to #{worker.name}"
    c.border = false
    c.klass = IssueGrid

    # we don't need the assignee__name column in this view
    c.override_columns = {
      assignee__name: {included: false}
    }

    # Make IssueGrid to only work with the issues for the inspected worker
    c.strong_default_attrs = {assignee_id: config.record_id}
    c.scope = {assignee_id: config.record_id}
  end
end
