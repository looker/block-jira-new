explore: sprint_core {
  extension: required
  join: issue_sprint {
    type:  left_outer
    sql_on: ${sprint.id} = ${issue_sprint.sprint_id} ;;
    relationship: one_to_many
  }
  join: issue {
    type:  left_outer
    sql_on: ${issue_sprint.issue_id} = ${issue.id} ;;
    relationship: one_to_many
  }

}
