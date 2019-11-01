- dashboard: epic_lookup
  title: Epic Lookup
  layout: newspaper
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
    col: 0
    width: 6
    height: 3
  - title: Days Since Created Date
    name: Days Since Created Date
    model: block_jira
    explore: epic
    type: single_value
    fields: [issue.created_date]
    fill_fields: [issue.created_date]
    filters:
      issue_type.name: Epic
    sorts: [issue.created_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: days_since_created_date, label: Days Since
          Created Date, expression: 'diff_days(${issue.created_date}, now())', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: number}]
    query_timezone: UTC
    series_types: {}
    hidden_fields: [issue.created_date]
    listen:
      Epic: epic.name
    row: 3
    col: 18
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
  - title: Created Date
    name: Created Date
    model: block_jira
    explore: epic
    type: single_value
    fields: [issue.created_date]
    fill_fields: [issue.created_date]
    filters:
      issue_type.name: Epic
    sorts: [issue.created_date desc]
    limit: 500
    query_timezone: UTC
    series_types: {}
    listen:
      Epic: epic.name
    row: 3
    col: 12
    width: 6
    height: 3
  - title: Key
    name: Key
    model: block_jira
    explore: epic
    type: single_value
    fields: [issue.key]
    filters:
      issue_type.name: Epic
    sorts: [issue.key]
    limit: 500
    query_timezone: UTC
    series_types: {}
    listen:
      Epic: epic.name
    row: 3
    col: 6
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
    height: 9
  - title: Issues by Status and Assignee
    name: Issues by Status and Assignee
    model: block_jira
    explore: epic
    type: looker_bar
    fields: [issue.count, status_category.name, issue.assignee]
    pivots: [status_category.name]
    sorts: [status_category.name, issue.count desc 0]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    font_size: '12'
    series_types: {}
    point_style: none
    series_colors:
      In Progress - issue.count: "#5DC370"
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
      Epic: epic.name
    row: 6
    col: 0
    width: 12
    height: 9
  - title: To Do Issues
    name: To Do Issues
    model: block_jira
    explore: epic
    type: table
    fields: [issue.key, issue.created_date, issue.summary, priority.name, issue.assignee]
    filters:
      status_category.name: To Do
    sorts: [issue.created_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_types: {}
    listen:
      Epic: epic.name
    row: 15
    col: 0
    width: 8
    height: 9
  - title: In Progress Issues
    name: In Progress Issues
    model: block_jira
    explore: epic
    type: table
    fields: [issue.key, issue.created_date, issue.summary, priority.name, issue.assignee]
    filters:
      status_category.name: In Progress
    sorts: [issue.created_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_types: {}
    listen:
      Epic: epic.name
    row: 15
    col: 8
    width: 8
    height: 9
  - title: Resolved Issues
    name: Resolved Issues
    model: block_jira
    explore: epic
    type: table
    fields: [issue.key, issue.created_date, issue.summary, priority.name, issue.assignee]
    filters:
      status_category.name: Done
    sorts: [issue.created_date desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_types: {}
    listen:
      Epic: epic.name
    row: 15
    col: 16
    width: 8
    height: 9
  filters:
  - name: Epic
    title: Epic
    type: field_filter
    default_value: ''
    allow_multiple_values: false
    required: false
    model: block_jira
    explore: epic
    listens_to_filters: []
    field: epic.name
