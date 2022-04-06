view: bm_d_calender_dt {
  sql_table_name: `mzcdsc-team-200716.project_b_team.bm_d_calender_dt`
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

  dimension: holiday_gb {
    type: string
    sql: ${TABLE}.holiday_gb ;;
  }

  dimension: week {
    type: string
    sql: ${TABLE}.week ;;
  }

  dimension: numbering {
    type: string
    sql: case when  week= '월요일' then '1'
          when week ='화요일' then '2'
          when week ='수요일' then '3'
          when week ='목요일' then '4'
          when week ='금요일' then '5'
          when week ='토요일' then '6'
          when week ='일요일' then '7' else null


 else null
          end;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
