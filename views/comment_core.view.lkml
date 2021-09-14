include: "//@{CONFIG_PROJECT_NAME}/comment.view"

view: comment {
  extends: [comment_config]
}

view: comment_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.COMMENT ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
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

  dimension: author_id {
    type: string
    hidden: yes
    sql: ${TABLE}.AUTHOR_ID ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.CREATED ;;
  }

  dimension: issue_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ISSUE_ID ;;
  }

  dimension: update_author_id {
    type: string
    sql: ${TABLE}.UPDATE_AUTHOR_ID ;;
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
    sql: ${TABLE}.UPDATED ;;
  }

  measure: count {
    type: count
    drill_fields: [id, issue.id, issue.epic_name]
  }
}
