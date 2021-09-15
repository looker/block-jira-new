include: "/views/*.view"

explore: issue {

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
  join: epic {
    type: left_outer
    sql_on:  ${board.id} = ${epic.board_id} ;;
    relationship: one_to_many
  }
  join: project_board {
    fields: []
    type: left_outer
    sql_on: ${board.id} = ${project_board.board_id} ;;
    relationship: one_to_many
  }
  join: project {
    type: left_outer
    sql_on:  ${project_board.project_id} = ${project.id}  ;;
    relationship: one_to_many
  }
  join: sla {
    type: left_outer
    sql_on: ${issue.id} = ${sla.issue_id} ;;
    relationship: many_to_one
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
    sql_on: ${issue.status} = ${status.id} ;;
    relationship: many_to_one
  }
  join:  resolution {
    type:  left_outer
    sql_on: ${issue.resolution} = ${resolution.id} ;;
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
  join: worklog {
    type: left_outer
    sql_on: ${issue.id} = ${worklog.issue_id} ;;
    relationship: one_to_many
  }
  join: user {
    type: left_outer
    sql_on: ${worklog.author_id} = ${user.id};;
    relationship: many_to_one
  }


}
