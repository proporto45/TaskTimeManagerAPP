# Custom worker form (predefined model and layout)
class WorkerForm < Netzke::Basepack::Form
  def configure(c)
    c.record = Worker.first # default worker id - handy for individual component testing

    super

    c.model = "Worker"
    c.items = [
      {
        layout: :hbox,
        border: false,
        defaults: {border: false},
        items: [{
          flex: 1,
          layout: :anchor,
          defaults: {anchor: "-8"},
          items: [:name, :email]
        },{
          flex: 1,
          layout: :anchor,
          defaults: {anchor: "100%"},
          items: [:number_of_issues, :number_of_open_issues]
        }]
      }
    ]
  end
end
