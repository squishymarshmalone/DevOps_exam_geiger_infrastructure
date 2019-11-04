provider "heroku" {}


resource "heroku_app" "app-ci" {
 region = "eu"
 name = "${var.app_prefix}-ci"

 sensitive_config_vars = {
    LOGZ_TOKEN="${var.logz_token}"
    LOGZ_URL="${var.logz_url}"
 }
}
resource "heroku_app" "app-stage" {
 region = "eu"
 name = "${var.app_prefix}-stage"

 sensitive_config_vars = {
    LOGZ_TOKEN="${var.logz_token}"
    LOGZ_URL="${var.logz_url}"
 }
}
resource "heroku_app" "app-prod" {
 region = "eu"
 name = "${var.app_prefix}-prod"

 sensitive_config_vars = {
    LOGZ_TOKEN="${var.logz_token}"
    LOGZ_URL="${var.logz_url}"
 }   
}
resource "heroku_pipeline" "app-pipeline" {
 name = "${var.pipeline_name}"
}
resource "heroku_pipeline_coupling" "ci" {
 app      = "${heroku_app.app-ci.name}"
 pipeline = "${heroku_pipeline.app-pipeline.id}"
 stage    = "development"
}
resource "heroku_pipeline_coupling" "stage" {
 app      = "${heroku_app.app-stage.name}"
 pipeline = "${heroku_pipeline.app-pipeline.id}"
 stage    = "staging"
}
resource "heroku_pipeline_coupling" "prod" {
 app      = "${heroku_app.app-prod.name}"
 pipeline = "${heroku_pipeline.app-pipeline.id}"
 stage    = "production"
}


