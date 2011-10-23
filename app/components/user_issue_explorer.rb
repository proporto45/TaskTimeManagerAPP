# Component that allows exploring issues per user (using 2 grids). Inherits from the same Netzke::Communitypack::OneToManyExplorer as ProjectIssueExplorer.
class UserIssueExplorer < Netzke::Communitypack::OneToManyExplorer
  title "Users/Issues"

  association :assignee # association that binds users and issues

  container_config  class_name: "UserGrid", # our custom UserGrid as container grid
                    region: :north # we want it on top

  collection_config class_name: "IssueGrid", override_columns: {
    assignee__name: {included: false} # we don'n need this column in ProjectIssueExplorer
  }
end