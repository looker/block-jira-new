include: "/views/*view"

explore: sprint {

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

}
