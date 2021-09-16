connection: "@{CONNECTION_NAME}"

include: "/dashboards/*.dashboard"
include: "/explores/*.explore"

datagroup: fivetran_datagroup {
  sql_trigger: SELECT max(date_trunc('minute', done)) FROM @{SCHEMA_NAME}.fivetran_audit ;;
  max_cache_age: "24 hours"
}

persist_with: fivetran_datagroup
