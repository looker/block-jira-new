# Update based on how you are associating versions to
explore: version_core {
  extension: required
  fields: [ALL_FIELDS*, -issue.issue_exclusion_set*]
  join: issue_fix_versions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${version.id} = ${issue_fix_versions.version_id} ;;
  }
  join: issue {
    type: left_outer
    relationship: one_to_one
    sql_on: ${issue_fix_versions.issue_id} = ${issue.id} ;;
  }
}
