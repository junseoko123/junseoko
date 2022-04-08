view: bm_f_subway_data_compare {
  sql_table_name: `mzcdsc-team-200716.project_b_team.bm_f_subway_data_compare`
    ;;

  measure: compare_get_cnt {
    type: number
    sql: ${TABLE}.compare_get_cnt ;;
  }

  measure: compare_get_off_cnt {
    type: number
    sql: ${TABLE}.compare_get_off_cnt ;;
  }

  measure: compare_moving_passenger_cnt {
    type: number
    sql: ${TABLE}.compare_moving_passenger_cnt ;;
  }

  measure: compare_sunsusong_cnt {
    type: number
    sql: ${TABLE}.compare_sunsusong_cnt ;;
  }

  dimension_group: dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dt ;;
  }

  measure: get_cnt {
    type: number
    sql: ${TABLE}.get_cnt ;;
  }

  measure: get_off_cnt {
    type: number
    sql: ${TABLE}.get_off_cnt ;;
  }

  measure: ls_get_cnt {
    type: number
    sql: ${TABLE}.ls_get_cnt ;;
  }

  measure: ls_get_off_cnt {
    type: number
    sql: ${TABLE}.ls_get_off_cnt ;;
  }

  measure: ls_moving_passenger_cnt {
    type: number
    sql: ${TABLE}.ls_moving_passenger_cnt ;;
  }

  measure: ls_sunsusong_cnt {
    type: number
    sql: ${TABLE}.ls_sunsusong_cnt ;;
  }

  measure: moving_passenger_cnt {
    type: number
    sql: ${TABLE}.moving_passenger_cnt ;;
  }

  measure: sunsusong_cnt {
    type: number
    sql: ${TABLE}.sunsusong_cnt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
