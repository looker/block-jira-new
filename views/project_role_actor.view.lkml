view: project_role_actor {
  sql_table_name: PROJECT_ROLE_ACTOR ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
    hidden: yes
  }

  dimension: project_role_id {
    type: number
    hidden: yes
    sql: ${TABLE}.project_role_id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id, group_name, project_role.name, project_role.id]
  }
}
