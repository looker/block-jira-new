include: "//block-jira-config/epic.view"

view: epic {
  extends: [epic_config]
}

view: epic_core {
  extension: required
  sql_table_name: jira_for_looker.epic ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

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
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: done {
    type: yesno
    sql: ${TABLE}.done ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: summary {
    type: string
    sql: ${TABLE}.summary ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, issue_epic_link_history.count]
  }
}
