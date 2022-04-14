view: bm_f_subway_card_dd {
  sql_table_name: `project_b_team.bm_f_subway_card_dd`
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

  measure: get_cnt {
    label: "총승차인원수 평균"
    type: average
    sql: ${TABLE}.get_cnt/10000;;
    value_format: "0.##"
  }





  measure: dynamic_filter_value{
    type: max
    sql: 1 ;;
    html: <p style =
              "color: #000000;
              font-size:30%;
              text-align:center">
              기간 : {% if _filters['dt_date']%}
                          {{_filters['dt_date']}}
                          {% else %} 전체 {% endif %}


        &nbsp;&nbsp;&nbsp;
              호선 : {% if _filters['subway_line_nm']%}
                          {{_filters['subway_line_nm']}}
                          {% else %} 전체 {% endif %}
              &nbsp;&nbsp;&nbsp;
              역 : {% if _filters['station_nm']%}
                          {{_filters['station_nm']}}
                          {% else %} 전체 {% endif %}
          </p>;;
  }


  measure: get_off_cnt {
    label: "총하차인원수 평균"
    type: average
    sql: ${TABLE}.get_off_cnt/10000;;
    value_format: "0.##"
  }

  measure: moving_passenger_cnt {
    type: sum
    sql: ${TABLE}.moving_passenger_cnt;;
  }

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_line_nm {
    type: string
    sql: ${TABLE}.subway_line_nm ;;
  }

  measure: sunsusong_cnt {
    type: sum
    sql: ${TABLE}.sunsusong_cnt ;;
  }

}
