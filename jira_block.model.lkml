connection: "looker_app"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: fivetran_datagroup {
  sql_trigger: SELECT max(date_trunc('minute', done)) FROM jira_for_looker.fivetran_audit ;;
  max_cache_age: "24 hours"
}

persist_with: fivetran_datagroup

explore: sprint {
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

# Update based on how you are associating versions to
explore: version {
  join: issue_fix_versions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${version.id} = ${issue_fix_versions.version_id} ;;
  }
  join: issue {
    type: left_outer
    relationship: one_to_one
    sql_on: ${issue_fix_versions.issue_id} = ${issue.id} ;;
  }
}

explore: issue {
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

### CURRENT OVERVIEW OF STATUS OF PROJECTS, ISSUES, AND ISSUE FACTS (E.G. # OF COMMENTS)

explore: project {
  join: issue {
    type:  left_outer
    sql_on: ${project.id} = ${issue.project} ;;
    relationship: many_to_one
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
}
