- dashboard: open_issues_overview
  title: Open Issues Overview
  layout: newspaper
  elements:
  - title: Open Issue Type Distribution
    name: Open Issue Type Distribution
    model: block_jira
    explore: issue
    type: looker_pie
    fields: [issue_type.name, issue.count]
    filters:
      status_category.name: "-Done"
    sorts: [issue.count desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: bfafa3ba-b38e-4656-8fe1-9e796981d7f0
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    listen:
      Project: project.name
      Epic: epic.name
    row: 16
    col: 17
    width: 7
    height: 6
  - title: Open Issues Status Distribution
    name: Open Issues Status Distribution
    model: block_jira
    explore: issue
    type: looker_pie
    fields: [issue.count, status.name]
    filters:
      status_category.name: "-Done"
    sorts: [issue.count desc]
    limit: 500
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: bfafa3ba-b38e-4656-8fe1-9e796981d7f0
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    listen:
      Project: project.name
      Epic: epic.name
    row: 22
    col: 17
    width: 7
    height: 6
  - title: Open Issues
    name: Open Issues
    model: block_jira
    explore: issue
    type: single_value
    fields: [issue.number_of_open_issues, issue.number_of_open_issues_this_month]
    filters:
      status_category.name: "-Done"
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Created This Month
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Project: project.name
      Epic: epic.name
    row: 12
    col: 17
    width: 7
    height: 4
  - title: Open Issues by Project
    name: Open Issues by Project
    model: block_jira
    explore: issue
    type: looker_bar
    fields: [project.name, issue.count, issue_type.name]
    pivots: [issue_type.name]
    filters:
      status_category.name: "-Done"
    sorts: [issue.count desc 0, issue_type.name]
    limit: 500
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: Bug - issue.count,
            id: Bug - issue.count, name: Bug}, {axisId: Design - issue.count, id: Design
              - issue.count, name: Design}, {axisId: Emergency - issue.count, id: Emergency
              - issue.count, name: Emergency}, {axisId: Epic - issue.count, id: Epic
              - issue.count, name: Epic}, {axisId: Improvement - issue.count, id: Improvement
              - issue.count, name: Improvement}, {axisId: Internal Task - issue.count,
            id: Internal Task - issue.count, name: Internal Task}, {axisId: New Feature
              - issue.count, id: New Feature - issue.count, name: New Feature}, {
            axisId: Regular - issue.count, id: Regular - issue.count, name: Regular},
          {axisId: Story - issue.count, id: Story - issue.count, name: Story}], showLabels: false,
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
      Epic: epic.name
    row: 0
    col: 12
    width: 12
    height: 12
  - title: Total Open Issues by Created Date and Type
    name: Total Open Issues by Created Date and Type
    model: block_jira
    explore: issue
    type: looker_area
    fields: [issue.created_month, issue_type.name, issue.count]
    pivots: [issue_type.name]
    fill_fields: [issue.created_month]
    filters:
      issue.created_month: 12 months
      status_category.name: "-Done"
    sorts: [issue.created_month desc, issue_type.name 0]
    limit: 500
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Count, orientation: left, series: [{axisId: issue.avg_days_to_resolve_issues_hours,
            id: Bug - issue.avg_days_to_resolve_issues_hours, name: Bug}, {axisId: issue.avg_days_to_resolve_issues_hours,
            id: Design - issue.avg_days_to_resolve_issues_hours, name: Design}, {
            axisId: issue.avg_days_to_resolve_issues_hours, id: Emergency - issue.avg_days_to_resolve_issues_hours,
            name: Emergency}, {axisId: issue.avg_days_to_resolve_issues_hours, id: Epic
              - issue.avg_days_to_resolve_issues_hours, name: Epic}, {axisId: issue.avg_days_to_resolve_issues_hours,
            id: Improvement - issue.avg_days_to_resolve_issues_hours, name: Improvement},
          {axisId: issue.avg_days_to_resolve_issues_hours, id: Internal Task - issue.avg_days_to_resolve_issues_hours,
            name: Internal Task}, {axisId: issue.avg_days_to_resolve_issues_hours,
            id: New Feature - issue.avg_days_to_resolve_issues_hours, name: New Feature},
          {axisId: issue.avg_days_to_resolve_issues_hours, id: Regular - issue.avg_days_to_resolve_issues_hours,
            name: Regular}, {axisId: issue.avg_days_to_resolve_issues_hours, id: Story
              - issue.avg_days_to_resolve_issues_hours, name: Story}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen:
      Project: project.name
      Epic: epic.name
    row: 12
    col: 0
    width: 17
    height: 16
  - title: Total Open Issues by Assignee
    name: Total Open Issues by Assignee
    model: block_jira
    explore: issue
    type: looker_bar
    fields: [user.name, issue.count, issue_type.name]
    pivots: [issue_type.name]
    filters:
      status_category.name: "-Done"
      user.name: "-NULL"
    sorts: [issue_type.name 0, total_issues]
    limit: 500
    dynamic_fields: [{table_calculation: total_issues, label: Total Issues, expression: 'sum(pivot_row(${issue.count}))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        _type_hint: number}]
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: Bug - issue.count,
            id: Bug - issue.count, name: Bug - Issue Count}, {axisId: Design - issue.count,
            id: Design - issue.count, name: Design - Issue Count}, {axisId: Emergency
              - issue.count, id: Emergency - issue.count, name: Emergency - Issue
              Count}, {axisId: Improvement - issue.count, id: Improvement - issue.count,
            name: Improvement - Issue Count}, {axisId: Internal Task - issue.count,
            id: Internal Task - issue.count, name: Internal Task - Issue Count}, {
            axisId: New Feature - issue.count, id: New Feature - issue.count, name: New
              Feature - Issue Count}, {axisId: Regular - issue.count, id: Regular
              - issue.count, name: Regular - Issue Count}, {axisId: Story - issue.count,
            id: Story - issue.count, name: Story - Issue Count}, {axisId: total_issues,
            id: total_issues, name: Total Issues}], showLabels: false, showValues: true,
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
    limit_displayed_rows: false
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
      Epic: epic.name
    row: 0
    col: 0
    width: 12
    height: 12
  - title: Issues by Epic and Status
    name: Issues by Epic and Status
    model: block_jira
    explore: issue
    type: looker_column
    fields: [epic.name, status.name, issue.number_of_open_issues]
    pivots: [status.name]
    filters:
      epic.done: 'No'
      epic.name: "-EMPTY"
      status_category.name: "-Done"
    sorts: [issue.number_of_open_issues desc 0, status.name]
    limit: 500
    query_timezone: UTC
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
        reverse: true
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
    listen: {}
    row: 28
    col: 0
    width: 24
    height: 10
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
  - name: Epic
    title: Epic
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_jira
    explore: issue
    listens_to_filters: []
    field: epic.name
