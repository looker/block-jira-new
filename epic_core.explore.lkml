explore: epic_core {
  extension: required
  fields: [ALL_FIELDS*, -issue.issue_exclusion_set*]
  join: issue {
    type:  left_outer
    sql_on: ${epic.name} = ${issue.epic_name} ;;
    relationship: one_to_many
  }
  join:  issue_type {
    type:  left_outer
    sql_on: ${issue.issue_type} = ${issue_type.id} ;;
    relationship: many_to_one
  }
  join:  priority {
    type:  left_outer
    sql_on: ${issue.priority} = ${priority.id} ;;
    relationship: many_to_one
  }
  join:  status {
    type:  left_outer
    sql_on: ${issue.status} = ${status.id} ;;
    relationship: many_to_one
  }
  join:  status_category {
    type:  left_outer
    sql_on: ${status.status_category_id} = ${status_category.id} ;;
    relationship: many_to_one
  }
  join: user {
    type: left_outer
    sql_on: ${issue.assignee} = ${user.id} ;;
    relationship: many_to_one
  }
}
