project_id                         = "prj-customer-shd-prd-ops-log-4d4e"
logsinkname                        = "sink-customer-shd-prd-ops-logging-prod"
pubsubname                         = "pubsub.googleapis.com/projects/prj-customer-shd-prd-ops-log-4d4e/topics/prod-logs"
logfilter                          = "logName:(\"folders/119964667007/logs\")"
pubsubtopic_name                   = "prod-logs"
shared_logsinkname                 = "sink-customer-shd-prd-ops-logging-shared"
shared_pubsubname                  = "pubsub.googleapis.com/projects/prj-customer-shd-prd-ops-log-4d4e/topics/prod-shared-logs"
shared_logfilter                   = "logName:(\"folders/705766516848/logs\")"
shared_pubsubtopic_name            = "prod-shared-logs"
retention                          = "2592000s"
region                             = "asia-south1"
roles                              = "roles/storage.objectCreator"
org_aggregated_logsink_name        = "asink-org-customer-prd-ops-logging-prod"
org_aggregated_shared_logsink_name = "asink-org-customer-prd-ops-logging-shared"
org_id                             = "231102621495"