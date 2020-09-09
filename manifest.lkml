project_name: "block-jira"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-jira-new-config"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "brick-layer"
  export: override_required
}

constant: SCHEMA_NAME {
  value: "jira"
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
