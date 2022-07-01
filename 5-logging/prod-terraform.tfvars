project_id                         = "prj-shd-prd-ops-log-b846"
logsinkname                        = "sink-customer-shd-prd-ops-logging-prod"
pubsubname                         = "pubsub.googleapis.com/projects/prj-shd-prd-ops-log-e3e9/topics/prod-logs"
logfilter                          = "logName:(\"folders/160723793651/logs\")"
pubsubtopic_name                   = "prod-logs"
shared_logsinkname                 = "sink-customer-shd-prd-ops-logging-shared"
shared_pubsubname                  = "pubsub.googleapis.com/projects/prj-shd-prd-ops-log-e3e9/topics/prod-shared-logs"
shared_logfilter                   = "logName:(\"folders/509232296234/logs\")"
shared_pubsubtopic_name            = "prod-shared-logs"
retention                          = "2592000s"
region                             = "asia-south1"
roles                              = "roles/storage.objectCreator"
org_aggregated_logsink_name        = "asink-org-customer-prd-ops-logging-prod"
org_aggregated_shared_logsink_name = "asink-org-customer-prd-ops-logging-shared"
org_id                             = "231102621495"