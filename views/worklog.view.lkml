view: worklog {
  sql_table_name: @{SCHEMA_NAME}.worklog ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: issue_id {
    type: number
    sql: ${TABLE}.issue_id ;;
    hidden: yes
  }

  dimension_group: started {
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
    sql: ${TABLE}.started ;;
  }

  dimension: time_spend_seconds {
    type: number
    sql: ${TABLE}.time_spend_seconds ;;
  }

  dimension: update_author_id {
    type: number
    sql: ${TABLE}.update_author_id ;;
    hidden: yes
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated ;;
  }

  measure: first_update_time {
    label: "Created Time"
    description: "The first date this issue was updated in Jira."
    type: date_time
    sql: MIN(${updated_raw}) ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: avg_minutes_spent {
    type: average
    sql: ${time_spend_seconds} / 60 ;;
    value_format_name: decimal_1
  }

  measure: total_minutes_spent {
    type: sum
    sql: ${time_spend_seconds} ;;
    value_format_name: decimal_1
  }
}
