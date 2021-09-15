- dashboard: issues_overview
  title: Issues Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Open Issues
    name: Open Issues
    model: block_jira_v2
    explore: issue
    type: single_value
    fields: [issue.count]
    filters:
      status_category.name: "-Done"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Project: project.name
      Epic: epic.name
      Created Time: worklog.first_update_time
    row: 0
    col: 0
    width: 6
    height: 3
  - title: Resolved Bugs
    name: Resolved Bugs
    model: block_jira_v2
    explore: issue
    type: single_value
    fields: [issue.count]
    filters:
      issue_type.is_bug: 'Yes'
      resolution.name: Fixed
    sorts: [issue.count desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Project: project.name
      Epic: epic.name
      Created Time: worklog.first_update_time
    row: 3
    col: 0
    width: 6
    height: 3
  - title: Most Commented Open Issues
    name: Most Commented Open Issues
    model: block_jira_v2
    explore: issue
    type: looker_bar
    fields: [issue.key, comment.count, priority.name]
    filters:
      status.name: "-Closed"
    sorts: [comment.count desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#462C9D"
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: In Progress - issue.count,
            id: In Progress - issue.count, name: In Progress}, {axisId: Open - issue.count,
            id: Open - issue.count, name: Open}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '12'
    series_types: {}
    series_colors: {}
    show_null_points: true
    interpolation: linear
    hidden_fields:
    defaults_version: 1
    listen:
      Project: project.name
      Epic: epic.name
      Created Time: worklog.first_update_time
    row: 9
    col: 13
    width: 11
    height: 7
  - title: Issues by Status
    name: Issues by Status
    model: block_jira_v2
    explore: issue
    type: looker_column
    fields: [issue.count, status.name, issue_type.name]
    pivots: [issue_type.name]
    filters:
      issue_type.name: "-NULL"
    sorts: [status.name, issue_type.name]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
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
    y_axes: [{label: '', orientation: left, series: [{axisId: running_total_bug_count,
            id: running_total_bug_count, name: Running Total Bug Count}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: last
      num_rows: '12'
    series_types: {}
    series_colors: {}
    show_null_points: true
    interpolation: linear
    hidden_fields:
    defaults_version: 1
    listen:
      Project: project.name
      Epic: epic.name
      Created Time: worklog.first_update_time
    row: 0
    col: 6
    width: 18
    height: 9
  - title: Open Bugs
    name: Open Bugs
    model: block_jira_v2
    explore: issue
    type: looker_grid
    fields: [issue.key, priority.name, worklog.started_date, sprint.name, sla.remaining_time,
      sla.stop_time_date]
    filters:
      issue_type.is_bug: 'Yes'
      status_category.name: "-Done"
    sorts: [sla.remaining_time]
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      priority.name: Priority
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: gooooooooogle, palette_id: gooooooooogle-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: []}]
    series_types: {}
    truncate_column_names: false
    defaults_version: 1
    listen:
      Project: project.name
      Epic: epic.name
      Created Time: worklog.first_update_time
    row: 23
    col: 0
    width: 24
    height: 5
  - title: Open Bugs Approaching SLA
    name: Open Bugs Approaching SLA
    model: block_jira_v2
    explore: issue
    type: looker_grid
    fields: [issue.key, priority.name, worklog.started_date, user.name, status.name,
      sla.remaining_time]
    filters:
      issue_type.is_bug: 'Yes'
      status.name: "-Closed"
      issue.is_approaching_sla: 'Yes'
    sorts: [sla.remaining_time, priority.name, issue.key]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      user.name: Assignee
    series_cell_visualizations:
      sla.remaining_time:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
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
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.number_of_resolved_issues,
            id: issue.number_of_resolved_issues, name: Number of Resolved Issues}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: This Tile lists open issues with type "Bug" that have SLA remaining
      time of less than 30 days. The filter logic for "Is Approaching SLA" can be
      changed in the config project.
    listen:
      Project: project.name
      Epic: epic.name
      Created Time: worklog.first_update_time
    row: 16
    col: 0
    width: 13
    height: 7
  - title: Open Bugs by Priority
    name: Open Bugs by Priority
    model: block_jira_v2
    explore: issue
    type: looker_bar
    fields: [priority.name, issue.number_of_open_issues]
    filters:
      issue_type.is_bug: 'Yes'
      priority.name: "-NULL"
    sorts: [issue.number_of_open_issues desc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.number_of_resolved_issues,
            id: issue.number_of_resolved_issues, name: Number of Resolved Issues}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    series_types: {}
    series_colors:
      issue.number_of_resolved_issues: "#462C9D"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Project: project.name
      Epic: epic.name
      Created Time: worklog.first_update_time
    row: 9
    col: 0
    width: 13
    height: 7
  - title: Total Time Spend
    name: Total Time Spend
    model: block_jira_v2
    explore: issue
    type: single_value
    fields: [worklog.total_minutes_spent]
    filters:
      resolution.name: Fixed
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Project: project.name
      Epic: epic.name
      Created Time: worklog.first_update_time
    row: 6
    col: 0
    width: 6
    height: 3
  - title: Bugs Needing Triage
    name: Bugs Needing Triage
    model: block_jira_v2
    explore: issue
    type: looker_grid
    fields: [issue.key, priority.name, status.name, sla.elapsed_time, worklog.started_date,
      worklog.first_update_time]
    filters:
      issue_type.is_bug: 'Yes'
      issue.needs_triage: 'Yes'
    sorts: [worklog.first_update_time]
    limit: 10
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      user.name: Assignee
      status.name: Status
    series_cell_visualizations:
      sla.remaining_time:
        is_active: true
      sla.elapsed_time:
        is_active: true
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
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
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.number_of_resolved_issues,
            id: issue.number_of_resolved_issues, name: Number of Resolved Issues}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    defaults_version: 1
    note_state: collapsed
    note_display: above
    note_text: This tile lists open issues with type "Bug" that no priority assigned.
      The filter logic for "Needs Triage" can be changed in the config project.
    listen:
      Project: project.name
      Epic: epic.name
      Created Time: worklog.first_update_time
    row: 16
    col: 13
    width: 11
    height: 7
  filters:
  - name: Project
    title: Project
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: block_jira_v2
    explore: issue
    listens_to_filters: []
    field: project.name
  - name: Epic
    title: Epic
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_jira_v2
    explore: issue
    listens_to_filters: []
    field: epic.name
  - name: Created Time
    title: Created Time
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_jira_v2
    explore: issue
    listens_to_filters: []
    field: worklog.first_update_time