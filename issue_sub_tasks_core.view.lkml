include: "//block-jira-config/issue_sub_tasks.view"

view: issue_sub_tasks {
  extends: [issue_sub_tasks_config]
}

view: issue_sub_tasks_core {
  sql_table_name: jira_for_looker.issue_sub_tasks ;;

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

  dimension: related_issue_id {
    type: number
    sql: ${TABLE}.RELATED_ISSUE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name]
  }
}
