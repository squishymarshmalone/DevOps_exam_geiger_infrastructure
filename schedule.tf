

resource "opsgenie_schedule" "pleb_schedule" {
  name          = "Plebian schedule"
  description   = "schedule of the plebian team"
  timezone      = "Europe/Oslo"
  enabled       = true
  owner_team_id = "${opsgenie_team.pleb_team.id}"
}

resource "opsgenie_schedule" "superstar_schedule" {
  name          = "Superstar schedule"
  description   = "schedule of the superstar team"
  timezone      = "Europe/Oslo"
  enabled       = true
  owner_team_id = "${opsgenie_team.superstar_team.id}"
}




resource "opsgenie_schedule_rotation" "pleb_schedule_rotation" { 
  schedule_id = "${opsgenie_schedule.pleb_schedule.id}"
  name        = "pleb_schedule_rotation"
  start_date  = "2019-10-18T08:00:00Z"
  end_date    ="2019-12-14T08:00:00Z"
  type        ="hourly"
  length      = 6

  participant {
    type = "user"
    id   = "${opsgenie_user.squishy_admin.id}"
  }
  participant {
    type = "user"
    id   = "${opsgenie_user.squishy_user.id}"
  }

  time_restriction {
    type = "time-of-day"

    restriction {
      start_hour = 6
      start_min  = 0
      end_hour   = 22
      end_min    = 0
    }
  }
}



resource "opsgenie_schedule_rotation" "superstar_schedule_rotation" { 
  schedule_id = "${opsgenie_schedule.superstar_schedule.id}"
  name        = "superstar_schedule_rotation"
  start_date  = "2019-10-18T08:00:00Z"
  end_date    ="2019-12-14T08:00:00Z"
  type        ="hourly"
  length      = 8

  participant {
    type = "user"
    id   = "${data.opsgenie_user.squishy_owner.id}"
  }

  time_restriction {
    type = "time-of-day"

    restriction {
      start_hour = 7
      start_min  = 0
      end_hour   = 19
      end_min    = 0
    }
  }
}

