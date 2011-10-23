# Custom user form (predefined model and layout)
class UserForm < Netzke::Basepack::FormPanel
  model "User"

  record_id User.first.try(:id) # default user id - handy for individual testing

  items [
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