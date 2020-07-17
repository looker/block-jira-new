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
    hidden: yes
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

  measure: count {
    type: count

    drill_fields: [issue_open_drill_set*]
  }

  measure: number_of_open_issues {
    type: count

    filters: {
      field: status_category.name
      value: "-Done"
    }

    drill_fields: [issue_open_drill_set*]
  }

#   measure: number_of_open_issues_this_month {
#     type: count
#
#     filters: {
#       field: status_category.name
#       value: "-Done"
#     }
#     filters: {
#       field: issue.created_date
#       value: "this month"
#     }
#
#     drill_fields: [issue_open_drill_set*]
#   }

#   measure: number_of_resolved_issues {
#     type: count
#
#     filters: {
#       field: issue.resolved_date
#       value: "-NULL"
#     }
#
#     drill_fields: [issue_open_drill_set*]
#   }


#   measure: number_of_issues_resolved_this_month {
#     type: count
#
#     filters: {
#       field: issue.resolved_date
#       value: "this month"
#     }
#
#     drill_fields: [issue_closed_drill_set*]
#   }

#   measure: number_of_issues_resolved_last_month {
#     type: count
#
#     filters: {
#       field: issue.resolved_date
#       value: "last month"
#     }
#
#     drill_fields: [issue_closed_drill_set*]
#   }

  # ----- Sets of fields for drilling ------
  #set: detail {
  #  fields: [
  #    external_issue_id,
  #  ]
  #}

  # set: issue_open_drill_set {
  #   fields: [key, created_date, status_category.name, assignee]
  # }

  # set: issue_closed_drill_set {
  #   fields: [key, resolved_date, assignee]
  # }


  # set: issue_exclusion_set {
  #   fields: [number_of_open_issues, number_of_open_issues_this_month, number_of_issues_closed_this_month, number_of_issues_closed_last_month]
  # }

}
