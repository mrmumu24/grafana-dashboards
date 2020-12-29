local grafana = import 'grafonnet/grafana.libsonnet';

grafana.dashboard.new(
  'Deployment',
  tags=['Deployment'],
)

// template
.addTemplate(
  grafana.template.datasource(
    'datasource',
    'prometheus',
    '',
  )
)

// deployment monitoring
.addRow(
  grafana.row.new(
    collapse=false,
    title='Deployment',
  )
  .addPanel(
    grafana.graphPanel.new(
      'app deployment',
      datasource='prometheus',
      labelY1='requests',
      lines=false,
      bars=true,
      stack=true,
      percentage=true,
      span=12,
    )
    .addTarget(
      grafana.prometheus.target(
        'sum(rate(requests_total{app="prod"}[5m])) by (version)',
        legendFormat='{{ version }}'
      )
    )
  )
)
