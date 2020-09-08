- dashboard: resolved_issues_overview
  title: Resolved Issues Overview
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Closed Issues
    name: Closed Issues
    model: block_jira
    explore: issue
    type: single_value
    fields: [issue.number_of_closed_issues]
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
    comparison_label: Last Month
    hidden_fields: []
    defaults_version: 1
    listen:
      Project: project.name
    row: 0
    col: 0
    width: 4
    height: 4
  - title: Avg Minutes to Issue Resolution
    name: Avg Minutes to Issue Resolution
    model: block_jira
    explore: issue
    type: single_value
    fields: [worklog.avg_minutes_spent]
    filters:
      status.name: Closed
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
    hidden_fields: [issue.avg_days_to_resolve_issues_hours]
    defaults_version: 1
    listen:
      Project: project.name
    row: 4
    col: 0
    width: 4
    height: 4
  - title: Longest Running Issues
    name: Longest Running Issues
    model: block_jira
    explore: issue
    type: table
    fields: [issue.key, sla.elapsed_time, issue_type.name, priority.name]
    filters:
      status.name: "-Closed,-Resolved,-Done"
    sorts: [sla.elapsed_time desc]
    limit: 500
    dynamic_fields: [{table_calculation: days_open, label: Days Open, expression: 'diff_days(${issue.created_date},
          now())', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number, is_disabled: true}]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5, reverse: true, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [sla.elapsed_time]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Project: project.name
    row: 16
    col: 0
    width: 24
    height: 9
  - title: Avg Minutes to Resolution by Issue Type
    name: Avg Minutes to Resolution by Issue Type
    model: block_jira
    explore: issue
    type: looker_bar
    fields: [issue_type.name, worklog.avg_minutes_spent]
    filters:
      issue_type.name: "-NULL"
    sorts: [issue_type.name]
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
    stacking: ''
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
      collection_id: gooooooooogle
      palette_id: gooooooooogle-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.avg_days_to_resolve_issues_hours,
            id: issue.avg_days_to_resolve_issues_hours, name: Avg Number of Days to
              Resolve Issues}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      worklog.avg_minutes_spent: "#34A852"
    defaults_version: 1
    listen:
      Project: project.name
    row: 8
    col: 16
    width: 8
    height: 8
  - title: Closed Issues by Priority
    name: Closed Issues by Priority
    model: block_jira
    explore: issue
    type: looker_column
    fields: [issue.count, priority.name, issue_type.name]
    pivots: [priority.name]
    filters:
      issue_type.name: "-NULL"
      status.name: Closed
    sorts: [issue.count desc 0, priority.name]
    limit: 500
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
    row: 0
    col: 4
    width: 20
    height: 8
  - title: Closed Issues by Type
    name: Closed Issues by Type
    model: block_jira
    explore: issue
    type: looker_pie
    fields: [issue.number_of_closed_issues, issue_type.name]
    sorts: [issue.number_of_closed_issues desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
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
    defaults_version: 1
    series_types: {}
    listen:
      Project: project.name
    row: 8
    col: 8
    width: 8
    height: 8
  - title: Closed Issues by Priority
    name: Closed Issues by Priority (2)
    model: block_jira
    explore: issue
    type: looker_bar
    fields: [issue.number_of_closed_issues, priority.name]
    sorts: [issue.number_of_closed_issues desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
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
    defaults_version: 1
    series_types: {}
    value_labels: legend
    label_type: labPer
    listen:
      Project: project.name
    row: 8
    col: 0
    width: 8
    height: 8
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
    model: block_jira
    explore: issue
    listens_to_filters: []
    field: project.name
