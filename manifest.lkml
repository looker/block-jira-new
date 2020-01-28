project_name: "block-jira"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-jira-config"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "looker_app"
  export: override_required
}

constant: SCHEMA_NAME {
  value: "jira_for_looker"
  export: override_required
}

constant: COMPANY_DOMAIN {
  value: "looker"
  export: override_required
}

################ Dependencies ################


local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }

  override_constant: COMPANY_DOMAIN {
    value: "@{COMPANY_DOMAIN}"
  }
}
