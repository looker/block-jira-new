include: "//@{CONFIG_PROJECT_NAME}/issue_board.view"

view: issue_board {
  extends: [issue_board_config]
}

view: issue_board_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.ISSUE_BOARD ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.ISSUE_ID || ' ' || ${TABLE}.BOARD_ID  ;;
  }

  dimension: issue_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: board_id {
    hidden: yes
    type: number
    sql: ${TABLE}.BOARD_ID ;;
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
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }


  measure: count {
    type: count
    drill_fields: [id, name, sprint.count]
  }
}
