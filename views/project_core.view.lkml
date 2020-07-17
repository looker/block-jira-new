include: "//@{CONFIG_PROJECT_NAME}/project.view"

view: project {
  extends: [project_config]
}

view: project_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.PROJECT ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: lead_id {
    type: number
    sql: ${TABLE}.LEAD_ID ;;
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

  dimension: project_category_id {
    type: number
    sql: ${TABLE}.PROJECT_CATEGORY_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, component.count, issue_project_history.count, version.count]
  }
}
