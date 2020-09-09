- dashboard: epic_lookup
  title: Epic Lookup
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Status
    name: Status
    model: block_jira
    explore: epic
    type: single_value
    fields: [epic.done]
    fill_fields: [epic.done]
    sorts: [epic.done]
    limit: 500
    dynamic_fields: [{table_calculation: is_done, label: 'Is Done?', expression: 'if
          (${epic.done} = yes, "Completed", "In Progress")', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: string}]
    query_timezone: UTC
    series_types: {}
    hidden_fields: [epic.done]
    listen:
      Epic: epic.name
    row: 3
    col: 6
    width: 6
    height: 3
  - title: Name
    name: Name
    model: block_jira
    explore: epic
    type: single_value
    fields: [epic.name]
    sorts: [epic.name]
    limit: 500
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Epic: epic.name
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Key
    name: Key
    model: block_jira
    explore: epic
    type: single_value
    fields: [epic.key]
    limit: 500
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Epic: epic.name
    row: 3
    col: 0
    width: 6
    height: 3
  - title: Issues by Status and Priority
    name: Issues by Status and Priority
    model: block_jira
    explore: epic
    type: looker_donut_multiples
    fields: [priority.name, status_category.name, issue.count]
    pivots: [status_category.name]
    sorts: [priority.name, status_category.name]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    color_application:
      collection_id: 5b121cce-cf79-457c-a52a-9162dc174766
      palette_id: 55dee055-18cf-4472-9669-469322a6f264
      options:
        steps: 5
    series_colors:
      In Progress - issue.count: "#5DC370"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: issue.number_of_resolved_issues,
            id: Epic - issue.number_of_resolved_issues, name: Epic}], showLabels: false,
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Epic: epic.name
    row: 6
    col: 12
    width: 12
    height: 12
  - title: Issues by Status and Type
    name: Issues by Status and Type
    model: block_jira
    explore: epic
    type: looker_bar
    fields: [issue.count, status_category.name, issue_type.name]
    pivots: [status_category.name]
    sorts: [status_category.name, issue.count desc 0]
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
            id: Epic - issue.number_of_resolved_issues, name: Epic}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    font_size: '12'
    series_types: {}
    series_colors:
      In Progress - issue.count: "#5DC370"
    defaults_version: 1
    listen:
      Epic: epic.name
    row: 6
    col: 0
    width: 12
    height: 12
  - title: In Progress Issues
    name: In Progress Issues
    model: block_jira
    explore: epic
    type: looker_grid
    fields: [issue.key, priority.name, issue.self, sprint.name, sla.remaining_time]
    filters:
      status.name: In Progress
    sorts: [sla.remaining_time desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      sprint.name: Sprint
    series_cell_visualizations:
      sla.remaining_time:
        is_active: true
    truncate_column_names: false
    series_types: {}
    defaults_version: 1
    listen:
      Epic: epic.name
    row: 18
    col: 0
    width: 12
    height: 8
  - title: Resolved Issues
    name: Resolved Issues
    model: block_jira
    explore: epic
    type: looker_grid
    fields: [issue.key, priority.name, issue.self, sprint.name, sla.remaining_time]
    filters:
      status.name: Closed
    sorts: [sla.remaining_time desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      sprint.name: Sprint
    series_cell_visualizations:
      sla.remaining_time:
        is_active: true
    truncate_column_names: false
    series_types: {}
    defaults_version: 1
    listen:
      Epic: epic.name
    row: 18
    col: 12
    width: 12
    height: 8
  - title: Number of Issues
    name: Number of Issues
    model: block_jira
    explore: epic
    type: single_value
    fields: [issue.count]
    limit: 500
    query_timezone: America/Los_Angeles
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
      Epic: epic.name
    row: 3
    col: 12
    width: 6
    height: 3
  - title: Avg Minutes Spent
    name: Avg Minutes Spent
    model: block_jira
    explore: epic
    type: single_value
    fields: [worklog.avg_minutes_spent]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
      Epic: epic.name
    row: 3
    col: 18
    width: 6
    height: 3
  filters:
  - name: Epic
    title: Epic
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: block_jira
    explore: epic
    listens_to_filters: []
    field: epic.name
