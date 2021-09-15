connection: "@{CONNECTION_NAME}"

include: "/views/*.view"
include: "/dashboards/*.dashboard"
include: "/explores/*.explore"


persist_with: fivetran_datagroup
