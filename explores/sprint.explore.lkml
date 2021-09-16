include: "/views/*view"

explore: sprint {

  fields: [ALL_FIELDS*,-issue.needs_triage, -issue.is_approaching_sla]

  join: board {
    type: left_outer
    sql_on: ${sprint.board_id} = ${board.id} ;;
    relationship: one_to_many
  }
  join: issue_board {
    fields: []
    type: left_outer
    sql_on: ${board.id} = ${issue_board.board_id} ;;
    relationship: one_to_many
  }
  join: issue {
    type:  left_outer
    sql_on: ${issue_board.issue_id} = ${issue.id} ;;
    relationship: one_to_many
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

}
