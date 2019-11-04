/*resource "opsgenie_user" "squishy_owner" {
  username  = "squishymarshmalone@gmail.com"
  full_name = "Squishy Marshmalone Admin"
  role      = "Owner"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}
*/
data "opsgenie_user" "squishy_owner" {
  username = "squishymarshmalone@gmail.com"
}



resource "opsgenie_user" "squishy_admin" {
  username  = "squishymarshmalone1@gmail.com"
  full_name = "Squishy Marshmalone Admin"
  role      = "Admin"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}



resource "opsgenie_user" "squishy_user" {
  username  = "squishymarshmalone2@gmail.com"
  full_name = "Squishy Marshmalone User"
  role      = "User"
  locale    = "no_NO"
  timezone  = "Europe/Oslo"
}


resource "opsgenie_team" "pleb_team" {
  name        = "Pleb team"
  description = "This is the team of peasants"

  member {
    id   = "${opsgenie_user.squishy_admin.id}"
    role = "admin"
  }

  member {
    id   = "${opsgenie_user.squishy_user.id}"
    role = "user"
  }
}


resource "opsgenie_team" "superstar_team" {
  name        = "Superstar team"
  description = "The team of superstar(s)"

  member {
    id   = "${data.opsgenie_user.squishy_owner.id}"
    role = "admin"
  }

}

