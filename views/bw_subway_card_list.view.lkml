view: bw_subway_card_list {
  sql_table_name: `project_b_team.bw_subway_card_list`
    ;;

  dimension: get_cnt {
    type: number
    sql: ${TABLE}.get_cnt ;;
  }

  dimension: get_off_cnt {
    type: number
    sql: ${TABLE}.get_off_cnt ;;
  }

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_route_nm {
    type: string
    sql: ${TABLE}.subway_route_nm ;;
  }

  dimension_group: use_dt {
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
    sql: ${TABLE}.use_dt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
