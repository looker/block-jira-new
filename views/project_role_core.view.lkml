include: "//@{CONFIG_PROJECT_NAME}/project_role.view"

view: project_role {
  extends: [project_role_config]
}

view: project_role_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.PROJECT_ROLE ;;

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
    drill_fields: [id, name, project_role_actor.count]
  }
}
