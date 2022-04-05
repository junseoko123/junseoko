view: bm_f_subway_passenger_dd {
  sql_table_name: `project_b_team.bm_f_subway_passenger_dd`
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

  dimension: passenger_type_gb_cd {
    type: string
    sql: ${TABLE}.passenger_type_gb_cd ;;
  }

  dimension: station_no {
    type: number
    sql: ${TABLE}.station_no ;;
  }

  dimension: subway_line_cd {
    type: number
    sql: ${TABLE}.subway_line_cd ;;
  }

  dimension: sunsusong_cnt {
    type: number
    sql: ${TABLE}.sunsusong_cnt ;;
  }

  dimension: time_gb_cd {
    type: string
    sql: ${TABLE}.time_gb_cd ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: numbering {
    type: string
    sql: case when  time_gb_cd= '07' then '출근시간'
           when time_gb_cd ='08' then '출근시간'
           when time_gb_cd ='18' then '퇴근시간'
           when time_gb_cd ='19' then '퇴근시간'
 else null
          end;;
}

###
  measure: get_aver {
    type: average
    label: "승차평균인원수"
    sql: ${TABLE}.get_cnt ;;
  }
  measure: get_off_aver {
    label: "하차평균인원수"
    type: average
    sql: ${TABLE}.get_off_cnt ;;
  }
  measure: moving_passenger_aver {
    label: "유동평균인원수"
    type: average
    sql: ${TABLE}.moving_passenger_cnt ;;
  }
  measure: sunsusong_aver {
    label: "순수송평균인원수"
    type: average
    sql: ${TABLE}.sunsusong_cnt ;;
  }

}
