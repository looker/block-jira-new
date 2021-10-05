view: epic {
  sql_table_name: @{SCHEMA_NAME}.epic ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: board_id {
    type: number
    sql: ${TABLE}.board_id ;;
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
    drill_fields: [id, name]
  }
}
