include: "//block-jira-config/issue_status_history.view"

view: issue_status_history {
  extends: [issue_status_history_config]
}

view: issue_status_history_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.issue_status_history ;;

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

  dimension: status_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.STATUS_ID ;;
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
    drill_fields: [issue.id, issue.epic_name, status.id, status.name]
  }
}