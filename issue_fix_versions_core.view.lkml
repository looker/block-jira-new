include: "//block-jira-config/issue_fix_versions.view"

view: issue_fix_versions {
  extends: [issue_fix_versions_config]
}

view: issue_fix_versions_core {
  extension: required
  sql_table_name: jira_for_looker.issue_fix_versions ;;

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: issue_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: version_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.VERSION_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [issue.id, issue.epic_name, version.id, version.name]
  }
}
