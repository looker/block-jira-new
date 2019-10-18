explore: issue_core {
  extension: required
  join: project {
    type: left_outer
    sql_on: ${project.id} = ${issue.project} ;;
    relationship: one_to_many
  }
  join:  issue_type {
    type:  left_outer
    sql_on: ${issue.issue_type} = ${issue_type.id} ;;
    relationship: many_to_one
  }
  join: issue_sprint {
    type: left_outer
    sql_on: ${issue_sprint.issue_id} = ${issue.id} ;;
    relationship: many_to_one
  }
  join: sprint {
    type: left_outer
    sql_on: ${issue_sprint.sprint_id} = ${sprint.id} ;;
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
  join: comment {
    type: left_outer
    sql_on: ${issue.id} = ${comment.issue_id} ;;
    relationship: one_to_many
  }
}
