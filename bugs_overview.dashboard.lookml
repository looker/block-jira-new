- dashboard: bugs_overview
  title: Bugs Overview
  layout: newspaper
  elements:
  - title: Open Bugs
    name: Open Bugs
    model: block_jira
    explore: issue
    type: single_value
    fields: [issue.count]
    filters:
      issue_type.is_bug: 'Yes'
      status_category.name: "-Done"
    limit: 500
    listen:
      Project: project.name
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Resolved Bugs (This Month)
    name: Resolved Bugs (This Month)
    model: block_jira
    explore: issue
    type: single_value
    fields: [issue.count]
    filters:
      issue_type.is_bug: 'Yes'
      status_category.name: Done
      issue.created_date: this month
    limit: 500
    listen:
      Project: project.name
    row: 3
    col: 0
    width: 6
    height: 3
  - title: Avg Time to Bug Resolution
    name: Avg Time to Bug Resolution
    model: block_jira
    explore: issue
    type: single_value
    fields: [issue.avg_days_to_resolve_issues_hours]
    filters:
      issue_type.is_bug: 'Yes'
    limit: 500
    dynamic_fields: [{table_calculation: formatted_avg_days_to_resolve_issue, label: Formatted
          Avg Days to Resolve Issue, expression: 'concat(to_string(round(${issue.avg_days_to_resolve_issues_hours},0)),
          " Days")', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: string}]
    hidden_fields: [issue.avg_days_to_resolve_issues_hours]
    listen:
      Project: project.name
    row: 9
    col: 0
    width: 6
    height: 3
  - title: Resolved Bugs (This Year)
    name: Resolved Bugs (This Year)
    model: block_jira
    explore: issue
    type: single_value
    fields: [issue.count]
    filters:
      issue_type.is_bug: 'Yes'
      status_category.name: Done
      issue.created_date: this year
    limit: 500
    listen:
      Project: project.name
    row: 6
    col: 0
    width: 6
    height: 3
  - title: Open Bugs by Assignee
    name: Open Bugs by Assignee
    model: block_jira
    explore: issue
    type: looker_bar
    fields: [issue.count, user.name, status.name]
    pivots: [status.name]
    filters:
      issue_type.is_bug: 'Yes'
      status_category.name: "-Done"
      user.name: "-NULL"
    sorts: [issue.count desc 0, status.name]
    limit: 500
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      custom:
        id: 493eebc7-4d19-943f-f038-bbe871291f98
        label: Custom
        type: continuous
        stops:
        - color: "#A2D869"
          offset: 0
        - color: "#50BBB3"
          offset: 33.333333333333336
        - color: "#436EB9"
          offset: 66.66666666666667
        - color: "#462C9D"
          offset: 100
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: In Progress - issue.count,
            id: In Progress - issue.count, name: In Progress}, {axisId: Open - issue.count,
            id: Open - issue.count, name: Open}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '12'
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#462C9D"
    show_null_points: true
    interpolation: linear
    hidden_fields:
    listen:
      Project: project.name
    row: 20
    col: 0
    width: 13
    height: 10
  - title: Bugs by Created Date and Status
    name: Bugs by Created Date and Status
    model: block_jira
    explore: issue
    type: looker_column
    fields: [issue.created_month, issue.count, status.name]
    pivots: [status.name]
    fill_fields: [issue.created_month]
    filters:
      issue_type.is_bug: 'Yes'
    sorts: [issue.created_month, status.name]
    limit: 500
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      custom:
        id: 493eebc7-4d19-943f-f038-bbe871291f98
        label: Custom
        type: continuous
        stops:
        - color: "#A2D869"
          offset: 0
        - color: "#50BBB3"
          offset: 33.333333333333336
        - color: "#436EB9"
          offset: 66.66666666666667
        - color: "#462C9D"
          offset: 100
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_bug_count,
            id: running_total_bug_count, name: Running Total Bug Count}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '12'
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    listen:
      Project: project.name
    row: 0
    col: 6
    width: 18
    height: 12
  - title: Open Bugs without Assignees
    name: Open Bugs without Assignees
    model: block_jira
    explore: issue
    type: table
    fields: [issue.key, priority.name, issue.summary, issue.created_date, sprint.name,
      project.name]
    filters:
      issue.assignee: 'NULL'
      issue_type.is_bug: 'Yes'
      status_category.name: "-Done"
    sorts: [issue.created_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Project: project.name
    row: 20
    col: 13
    width: 11
    height: 17
  - title: Resolved Bugs by Month
    name: Resolved Bugs by Month
    model: block_jira
    explore: issue
    type: looker_area
    fields: [issue.resolved_month, issue.number_of_resolved_issues]
    fill_fields: [issue.resolved_month]
    filters:
      issue.resolved_month: 12 months
      issue_type.is_bug: 'Yes'
    sorts: [issue.resolved_month desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.number_of_resolved_issues,
            id: issue.number_of_resolved_issues, name: Number of Resolved Issues}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Project: project.name
    row: 12
    col: 0
    width: 24
    height: 8
  - title: Open Bugs by Priority
    name: Open Bugs by Priority
    model: block_jira
    explore: issue
    type: looker_bar
    fields: [issue.number_of_resolved_issues, priority.name]
    filters:
      issue_type.is_bug: 'Yes'
    sorts: [issue.number_of_resolved_issues desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.number_of_resolved_issues,
            id: issue.number_of_resolved_issues, name: Number of Resolved Issues}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      issue.number_of_resolved_issues: "#462C9D"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 30
    col: 0
    width: 13
    height: 7
  filters:
  - name: Project
    title: Project
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_jira
    explore: issue
    listens_to_filters: []
    field: project.name
