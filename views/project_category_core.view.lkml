include: "//@{CONFIG_PROJECT_NAME}/project_category.view"

view: project_category {
  extends: [project_category_config]
}

view: project_category_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.PROJECT_CATEGORY ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
