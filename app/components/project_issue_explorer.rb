# Component that allows exploring issues per project (using 2 grids). Inherits from the same Netzke::Communitypack::OneToManyExplorer as UserIssueExplorer.
class ProjectIssueExplorer < Netzke::Communitypack::OneToManyExplorer
  title "Projects/Issues"

  container_config ({
    region: :north,
    class_name: "ProjectGrid"
  })

  collection_config ({
    class_name: "IssueGrid",
    override_columns: {
      project__name: {included: false} # we don'n need this column in ProjectIssueExplorer
    }
  })
end