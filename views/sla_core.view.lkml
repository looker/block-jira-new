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

  dimension: elapsed_time_dim {
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
    hidden: yes
  }

  dimension: is_ongoing_cycle {
    type: yesno
    sql: ${TABLE}.is_ongoing_cycle ;;
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
    hidden: yes
  }

  dimension: paused {
    type: yesno
    sql: ${TABLE}.paused ;;
  }

  dimension: remaining_time_dim {
    type: number
    hidden: yes
    sql: ${TABLE}.remaining_time ;;
  }

  dimension_group: start_time {
    type: time
    sql: ${TABLE}.start_time ;;
    timeframes: [date, year, quarter, month_name]
  }

  dimension_group: stop_time {
    type: time
    sql: ${TABLE}.stop_time ;;
    timeframes: [date, year, quarter, month_name]
  }

  dimension: within_calendar_hours {
    type: yesno
    sql: ${TABLE}.within_calendar_hours ;;
  }

  measure: remaining_time {
    type: sum
    sql: ${remaining_time_dim} ;;
    value_format_name: decimal_1
    html: {% if value < 0 %} <p style="color: red">{{ rendered_value }}</p>
    {% elsif value == 0 %} <p style="color: orange">{{ rendered_value }}</p>
    {% else %} {{rendered_value}}
    {% endif %} ;;
  }

  measure: elapsed_time {
    type: sum
    sql: ${elapsed_time_dim} ;;
    value_format_name: decimal_1
  }
}
