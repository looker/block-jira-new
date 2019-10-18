include: "//block-jira-config/status.view"

view: status {
  extends: [status_config]
}

view: status_core {
  extension: required
  sql_table_name: jira_for_looker.status ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension_group: _FIVETRAN_SYNCED {
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
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: status_category_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.STATUS_CATEGORY_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, status_category.id, status_category.name, issue_status_history.count]
  }
}
