view: bm_f_pssenger_anal_5y {
  sql_table_name: `project_b_team.bm_f_pssenger_anal_5y`
    ;;

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

  dimension: get_cnt {
    type: number
    sql: ${TABLE}.get_cnt ;;
  }

  dimension: get_off_cnt {
    type: number
    sql: ${TABLE}.get_off_cnt ;;
  }

  dimension: moving_passenger_cnt {
    type: number
    sql: ${TABLE}.moving_passenger_cnt ;;
  }

  dimension: passenger_info_gb_cd {
    type: string
    sql: ${TABLE}.passenger_info_gb_cd ;;
  }

  dimension: station_no {
    type: number
    sql: ${TABLE}.station_no ;;
  }

  dimension: subway_route_nm {
    type: number
    sql: ${TABLE}.subway_route_nm ;;
  }

  dimension: sunsusong_cnt {
    type: number
    sql: ${TABLE}.sunsusong_cnt ;;
  }

  dimension: time_gb_cd {
    type: number
    sql: ${TABLE}.time_gb_cd ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
