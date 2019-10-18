include: "//block-jira-config/issue_labels.view"

view: issue_labels {
  extends: [issue_labels_config]
}

view: issue_labels_core {
  extension: required
  sql_table_name: jira_for_looker.issue_labels ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.VALUE ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name]
  }
}
