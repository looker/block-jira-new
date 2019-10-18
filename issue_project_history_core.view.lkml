include: "//block-jira-config/issue_project_history.view"

view: issue_project_history {
  extends: [issue_project_history_config]
}

view: issue_project_history_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.issue_project_history ;;

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: project_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.PROJECT_ID ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.TIME ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.TIME ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name, project.id, project.name]
  }
}