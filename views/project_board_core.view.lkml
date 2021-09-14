include: "//@{CONFIG_PROJECT_NAME}/project_board.view"

view: project_board {
  extends: [project_board_config]
}

view: project_board_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.PROJECT_BOARD ;;

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.PROJECT_ID || ' ' || ${TABLE}.BOARD_ID  ;;
  }

  dimension: project_id {
    type: number
    hidden: yes
    sql: ${TABLE}.PROJECT_ID ;;
  }

  dimension: board_id {
    hidden: yes
    type: number
    sql: ${TABLE}.BOARD_ID ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    hidden: yes
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
    hidden: yes
    drill_fields: [id, name, sprint.count]
  }
}
