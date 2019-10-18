include: "//block-jira-config/issue_resolution_history.view"

view: issue_resolution_history {
  extends: [issue_resolution_history_config]
}

view: issue_resolution_history_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.issue_resolution_history ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: resolution_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.RESOLUTION_ID ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}.TIME ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name, resolution.id, resolution.name]
  }
}