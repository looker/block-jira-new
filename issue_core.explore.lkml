explore: issue_core {
  extension: required

  join: issue_board {
    fields: []
    type: left_outer
    sql_on: ${issue_board.issue_id} = ${issue.id} ;;
    relationship: one_to_many
  }
  join: board {
    type: left_outer
    sql_on: ${issue_board.board_id} = ${board.id} ;;
    relationship: one_to_many
  }
  join: sprint {
    type: left_outer
    sql_on: ${board.id} = ${sprint.board_id} ;;
    relationship: many_to_one
  }
  join:  issue_type {
    type:  left_outer
    sql_on: ${issue.id} = ${issue_type.id} ;;
    relationship: many_to_one
  }
  join:  priority {
    type:  left_outer
    sql_on: ${issue.priority} = ${priority.id} ;;
    relationship: many_to_one
  }
  join:  status {
    type:  left_outer
    sql_on: ${issue.id} = ${status.id} ;;
    relationship: many_to_one
  }
  join:  resolution {
    type:  left_outer
    sql_on: ${issue.id} = ${resolution.id} ;;
    relationship: many_to_one
  }
  join:  status_category {
    type:  left_outer
    sql_on: ${status.status_category_id} = ${status_category.id} ;;
    relationship: many_to_one
  }
  join: comment {
    type: left_outer
    sql_on: ${issue.id} = ${comment.issue_id} ;;
    relationship: one_to_many
  }

}
