resource "statuscake_test" "stage" {
  website_name = "app-stage"
  website_url = "${heroku_app.app-stage.web_url}"
  test_type = "HTTP"
  check_rate = "400"
  contact_group = ["Default Contact Group"]

}

resource "statuscake_test" "prod" {
  website_name = "app-prod"
  website_url = "${heroku_app.app-prod.web_url}"
  test_type = "HTTP"
  check_rate = "400"
  contact_group = ["Default Contact Group"]

}