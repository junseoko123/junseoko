connection: "view_passenger_anal_tmp"

# include all the views
include: "/views/**/*.view"

datagroup: junseoko_panssenger_anal_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: junseoko_panssenger_anal_default_datagroup

explore: bm_f_pssenger_anal_5y {}

explore: bl_subway_card_list {}

explore: bw_subway_passenger_list {}

explore: bm_f_card_anal_5y {}

explore: bl_subway_passenger_list {}

explore: bw_subway_card_list {}
