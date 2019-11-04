Devops_exam_infrastructure


travis encrypt OPSGENIE_API_KEY=<api_key> --add

travis encrypt STATUSCAKE_USERNAME=<username> --add
travis encrypt STATUSCAKE_APIKEY=<api_key> --add

travis encrypt HEROKU_EMAIL=<email> --add 
travis encrypt HEROKU_API_KEY=<api_key> --add 

travis encrypt AWS_ACCESS_KEY_ID=<key_id> --add
travis encrypt AWS_SECRET_ACCESS_KEY=<access_key> --add


travis encrypt TF_VAR_logz_url=<url> --add
travis encrypt TF_VAR_logz_token=<token> --add