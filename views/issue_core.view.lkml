include: "//@{CONFIG_PROJECT_NAME}/issue.view"

view: issue {
  extends: [issue_config]
}

view: issue_core {
  extension: required
  sql_table_name: @{SCHEMA_NAME}.ISSUE ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    hidden: yes
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

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
    link: {
    url:"http://@{COMPANY_DOMAIN}.atlassian.net/browse/{{ value }}"
    label: "View in Jira"
    }
  }

  dimension: priority {
    type: number
    hidden: yes
    sql: ${TABLE}.priority ;;
  }

  dimension: resolution {
    group_label: "Resolution"
    hidden: yes
    type: number
    sql: ${TABLE}.resolution ;;
  }

  dimension: status {
    #hidden: yes
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: self {
    type: string
    sql: ${TABLE}.self ;;
  }

  dimension: change_log {
    type: string
    sql: ${TABLE}.change_log ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: epic_link {
    type: number
    sql: ${TABLE}.epic_link ;;
  }

  measure: count {
    type: count
  }

  measure: number_of_open_issues {
    type: count

    filters: {
      field: status_category.name
      value: "-Closed"
    }
  }

  measure: number_of_closed_issues {
    type: count

    filters: {
      field: status_category.name
      value: "Closed"
    }
  }


}
