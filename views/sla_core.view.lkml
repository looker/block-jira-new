include: "//@{CONFIG_PROJECT_NAME}/sla.view"

view: sla {
  extends: [sla_config]
}

view: sla_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.SLA ;;

  dimension: sla_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.sla_id ;;
  }

  dimension: breached {
    type: yesno
    sql: ${TABLE}.breached ;;
  }

  dimension: elapsed_time {
    type: number
    sql: ${TABLE}.elapsed_time ;;
  }

  dimension: goal_duration {
    type: number
    sql: ${TABLE}.goal_duration ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: is_ongoing_cycle {
    type: yesno
    sql: ${TABLE}.is_ongoing_cycle ;;
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
  }

  dimension: paused {
    type: yesno
    sql: ${TABLE}.paused ;;
  }

  dimension: remaining_time {
    type: number
    sql: ${TABLE}.remaining_time ;;
  }

  dimension: start_time {
    type: string
    sql: ${TABLE}.start_time ;;
  }

  dimension: stop_time {
    type: string
    sql: ${TABLE}.stop_time ;;
  }

  dimension: within_calendar_hours {
    type: yesno
    sql: ${TABLE}.within_calendar_hours ;;
  }

  measure: count {
    type: count
    drill_fields: [sla_id]
  }
}
