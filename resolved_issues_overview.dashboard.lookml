- dashboard: resolved_issues_overview
  title: Resolved Issues Overview
  layout: newspaper
  elements:
  - title: Resolved Issues (This Month)
    name: Resolved Issues (This Month)
    model: block_jira
    explore: issue
    type: single_value
    fields: [issue.number_of_issues_resolved_this_month, issue.number_of_issues_resolved_last_month]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last Month
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    listen:
      Project: project.name
    row: 0
    col: 0
    width: 6
    height: 4
  - title: Avg Days to Issue Resolution
    name: Avg Days to Issue Resolution
    model: block_jira
    explore: issue
    type: single_value
    fields: [issue.avg_days_to_resolve_issues_hours]
    limit: 500
    dynamic_fields: [{table_calculation: formatted_avg_days_to_resolve, label: Formatted
          Avg Days to Resolve, expression: 'concat(to_string(round(${issue.avg_days_to_resolve_issues_hours},0)),
          " Days")', value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: string}]
    hidden_fields: [issue.avg_days_to_resolve_issues_hours]
    listen:
      Project: project.name
    row: 0
    col: 6
    width: 6
    height: 4
  - title: Resolved Epics (This Year)
    name: Resolved Epics (This Year)
    model: block_jira
    explore: issue
    type: single_value
    fields: [issue.number_of_resolved_issues]
    filters:
      issue.resolved_date: 1 years
      issue_type.name: Epic
    sorts: [issue.number_of_resolved_issues desc]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last Month
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    listen:
      Project: project.name
    row: 0
    col: 18
    width: 6
    height: 4
  - title: Resolved Issues (This Year)
    name: Resolved Issues (This Year)
    model: block_jira
    explore: issue
    type: single_value
    fields: [issue.number_of_resolved_issues]
    filters:
      issue.resolved_date: 1 years
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last Month
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: []
    listen:
      Project: project.name
    row: 0
    col: 12
    width: 6
    height: 4
  - title: Issues Resolved vs Avg Time to Resolve
    name: Issues Resolved vs Avg Time to Resolve
    model: block_jira
    explore: issue
    type: looker_column
    fields: [issue.created_month, issue.number_of_resolved_issues, issue.avg_days_to_resolve_issues_hours]
    fill_fields: [issue.created_month]
    filters:
      issue.resolved_date: 12 months
    sorts: [issue.created_month desc]
    limit: 500
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      custom:
        id: 61cdeb96-3a01-e46d-7d20-344de84bed5e
        label: Custom
        type: discrete
        colors:
        - "#2865BE"
        - "#93CF6C"
        - "#170658"
        - "#359299"
        - "#177BC5"
        - "#5DC370"
        - "#CADB68"
        - "#FFE663"
        - "#4CB388"
        - "#373EA5"
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.number_of_resolved_issues,
            id: issue.number_of_resolved_issues, name: Number of Resolved Issues}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        type: linear}, {label: '', orientation: left, series: [{axisId: issue.avg_days_to_resolve_issues_hours,
            id: issue.avg_days_to_resolve_issues_hours, name: Avg Number of Days to
              Resolve Issues}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types:
      issue.avg_days_to_resolve_issues_hours: line
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    label_color: ["#93CF6C"]
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#2865BE"
    value_labels: legend
    label_type: labPer
    listen:
      Project: project.name
    row: 4
    col: 0
    width: 24
    height: 9
  - title: Total Issues Resolved by Date and Type
    name: Total Issues Resolved by Date and Type
    model: block_jira
    explore: issue
    type: looker_column
    fields: [issue.resolved_month, issue_type.name, issue.number_of_resolved_issues]
    pivots: [issue_type.name]
    fill_fields: [issue.resolved_month]
    filters:
      issue.resolved_date: 12 months
    sorts: [issue.resolved_month desc, issue_type.name]
    limit: 500
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 313d7e4a-1e68-4f9c-9a5d-3135d8ffaa47
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: Bug - issue.count, id: Bug
              - issue.count, name: Bug}, {axisId: Design - issue.count, id: Design
              - issue.count, name: Design}, {axisId: Emergency - issue.count, id: Emergency
              - issue.count, name: Emergency}, {axisId: Epic - issue.count, id: Epic
              - issue.count, name: Epic}, {axisId: Improvement - issue.count, id: Improvement
              - issue.count, name: Improvement}, {axisId: Internal Task - issue.count,
            id: Internal Task - issue.count, name: Internal Task}, {axisId: New Feature
              - issue.count, id: New Feature - issue.count, name: New Feature}, {
            axisId: Regular - issue.count, id: Regular - issue.count, name: Regular}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: asc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    listen:
      Project: project.name
    row: 13
    col: 0
    width: 12
    height: 8
  - title: Longest Running Issues
    name: Longest Running Issues
    model: block_jira
    explore: issue
    type: table
    fields: [issue.key, issue.created_date, issue.summary, issue.assignee]
    filters:
      status.name: "-Closed,-Resolved,-Done"
    sorts: [issue.created_date]
    limit: 500
    dynamic_fields: [{table_calculation: days_open, label: Days Open, expression: 'diff_days(${issue.created_date},
          now())', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: number}]
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5, reverse: true, stepped: true}}, bold: false, italic: false,
        strikethrough: false, fields: [days_open]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    listen:
      Project: project.name
    row: 21
    col: 0
    width: 24
    height: 9
  - title: Avg Days to Resolution by Issue Type
    name: Avg Days to Resolution by Issue Type
    model: block_jira
    explore: issue
    type: looker_bar
    fields: [issue_type.name, issue.avg_days_to_resolve_issues_hours]
    filters:
      issue_type.name: "-Epic"
    sorts: [issue.avg_days_to_resolve_issues_hours desc]
    limit: 10
    column_limit: 50
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.avg_days_to_resolve_issues_hours,
            id: issue.avg_days_to_resolve_issues_hours, name: Avg Number of Days to
              Resolve Issues}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
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
    listen:
      Project: project.name
    row: 13
    col: 12
    width: 12
    height: 8
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
