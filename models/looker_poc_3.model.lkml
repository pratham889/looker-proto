connection: "looker-prototype"

# include all the views
include: "/views/**/*.view"

datagroup: looker_poc_3_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_poc_3_default_datagroup

explore: cc_anomaly {}
