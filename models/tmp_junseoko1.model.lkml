connection: "tmp_junseoko"

# include all the views
include: "/views/**/*.view"

datagroup: tmp_junseoko1_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: tmp_junseoko1_default_datagroup

explore: bm_f_subway_card_dd {
  join:  bm_d_calender_dt{
    type: left_outer
    sql_on:  ${bm_f_subway_card_dd.dt_date}=${bm_d_calender_dt.dt_date};;
    relationship: many_to_one

  }
}


explore: bm_d_calender_dt {}


explore: bm_f_subway_passenger_dd {
  join:  bm_d_passenger_type_cd{
    type: left_outer
      sql_on:  ${bm_f_subway_passenger_dd.passenger_type_gb_cd}=${bm_d_passenger_type_cd.cd};;
      relationship: many_to_one
      }
  }

explore: bm_d_passenger_type_cd {}

explore: bm_f_subway_data_compose {}
