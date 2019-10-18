include: "//block-jira-config/user_group.view"

view: user_group {
  extends: [user_group_config]
}

view: user_group_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.user_group ;;

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

  dimension: group_name {
    type: string
    sql: ${TABLE}.GROUP_NAME ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.USER_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [group_name, user.id, user.name]
  }
}