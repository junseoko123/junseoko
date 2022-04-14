view: bm_f_subway_data_compare {
  sql_table_name: `mzcdsc-team-200716.project_b_team.bm_f_subway_data_compare`
    ;;

  dimension: before_month {
    type: number
    sql: ${TABLE}.before_month ;;
  }

  dimension: col_nm {
    type: string
    sql: ${TABLE}.col_nm ;;
  }

  dimension: compose {
    type: number
    sql: ${TABLE}.compose ;;
  }

  dimension: this_month {
    type: number
    sql: ${TABLE}.this_month ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
