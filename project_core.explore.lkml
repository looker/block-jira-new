explore: project_core {
  extension: required

  join: project_category {
    type:  left_outer
    sql_on: ${project.project_category_id} = ${project_category.id} ;;
    relationship: many_to_one
  }
  join: user {
    type:  left_outer
    sql_on: ${project.lead_id} = ${user.id} ;;
    relationship: many_to_one
  }
  join: project_role_actor {
    type:  left_outer
    sql_on: ${project.id} = ${project_role_actor.project_id} ;;
    relationship: many_to_one
  }
  join: version {
    type:  left_outer
    sql_on: ${project.id} = ${version.project_id} ;;
    relationship: many_to_one
  }
  join: component {
    type:  left_outer
    sql_on: ${project.id} = ${component.project_id} ;;
    relationship: many_to_one
  }
  join: project_board {
    fields: []
    type: left_outer
    sql_on: ${project.id} = ${project_board.project_id} ;;
    relationship: one_to_many
  }
  join: board {
    type: left_outer
    sql_on: ${project_board.board_id} = ${board.id} ;;
    relationship: one_to_many
  }
  join: issue_board {
    fields: []
    type: left_outer
    sql_on: ${board.id} = ${issue_board.board_id} ;;
    relationship: one_to_many
  }
  join: issue {
    type: left_outer
    sql_on: ${issue_board.issue_id} = ${issue.id} ;;
    relationship: one_to_many
  }






  # join: issue {
  #   type:  left_outer
  #   sql_on: ${project.id} = ${issue.project} ;;
  #   relationship: many_to_one
  # }
  # join:  issue_type {
  #   type:  left_outer
  #   sql_on: ${issue.issue_type} = ${issue_type.id} ;;
  #   relationship: many_to_one
  # }
  # join: issue_board {
  #   fields: []
  #   type: left_outer
  #   sql_on: ${issue.id} = ${issue_board.issue_id} ;;
  #   relationship: one_to_many
  # }
  # join: board {
  #   type: left_outer
  #   sql_on: ${issue_board.board_id} = ${board.id} ;;
  #   relationship: one_to_many
  # }
  # join: sprint {
  #   type: left_outer
  #   sql_on:  ${board.id} = ${sprint.board_id};;
  #   relationship: many_to_one
  # }
  # join:  priority {
  #   type:  left_outer
  #   sql_on: ${issue.priority} = ${priority.id} ;;
  #   relationship: many_to_one
  # }
  # join:  status {
  #   type:  left_outer
  #   sql_on: ${issue.status} = ${status.id} ;;
  #   relationship: many_to_one
  # }
  # join:  status_category {
  #   type:  left_outer
  #   sql_on: ${status.status_category_id} = ${status_category.id} ;;
  #   relationship: many_to_one
  # }
}
