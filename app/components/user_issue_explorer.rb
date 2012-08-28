# Component that allows exploring issues per user (using 2 grids). Inherits from the same Netzke::Communitypack::OneToManyExplorer as ProjectIssueExplorer.
class UserIssueExplorer < Netzke::Communitypack::OneToManyExplorer
  def configure(c)
    c.title = "Users/Issues"
    c.foreign_key = :assignee_id
    super
  end

  component :container do |c|
    c.klass = UserGrid
    c.region = :north
    c.height = 200
    c.split = true
    super c
  end

  component :collection do |c|
    c.klass = IssueGrid
    c.override_columns = {
      assignee__name: {included: false} # we don'n need this column in ProjectIssueExplorer
    }
    super c
  end
end
