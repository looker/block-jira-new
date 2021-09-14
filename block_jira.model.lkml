connection: "@{CONNECTION_NAME}"

include: "views/*.view"
include: "*.dashboard"
include: "*.explore"

include: "//@{CONFIG_PROJECT_NAME}/*.view"
include: "//@{CONFIG_PROJECT_NAME}/*.model"
include: "//@{CONFIG_PROJECT_NAME}/*.dashboard"

persist_with: fivetran_datagroup

explore: sprint {
  extends: [sprint_config]
}

explore: issue {
  extends: [issue_config]
}

explore: project {
  extends: [project_config]
}

explore: epic {
  extends: [epic_config]
}
