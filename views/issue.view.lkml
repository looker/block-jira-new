view: issue {
  sql_table_name: @{SCHEMA_NAME}.issue ;;

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

  dimension: needs_triage {
    type: yesno
    description: "By default, issues with no priority will be labeled as needing triage. This defaul can by modified in the config project. "
    sql: CASE WHEN ${priority.name} IS NULL THEN true ELSE false END ;;
  }

  dimension: is_approaching_sla {
    description: "Wheather the SLA is less than 30 days away."
    type: yesno
    sql: CASE WHEN (${sla.remaining_time_dim}/ (1000 * 60 * 60 * 24)) < 30 THEN true ELSE false END ;;
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
