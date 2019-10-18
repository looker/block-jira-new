connection: "looker_app"

include: "*.view"
include: "*.dashboard"
include: "*.explore"

include: "//block-jira-config/*.view"
include: "//block-jira-config/*.model"

persist_with: fivetran_datagroup

explore: sprint {
  extends: [sprint_config]
}

explore: version {
  extends: [version_config]
}

explore: issue {
  extends: [issue_config]
}

explore: project {
  extends: [project_config]
}
