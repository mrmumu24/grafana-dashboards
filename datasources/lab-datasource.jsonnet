local datasource_name = 'prometheus';
local datasource_type = 'prometheus';
local datasource_url = 'prometheus-server.monitoring.svc.cluster.local';

{
  name: datasource_name,
  type: datasource_type,
  url: datasource_url,
  access: 'server',
  basicAuth: false,
  isDefault: true,
}
