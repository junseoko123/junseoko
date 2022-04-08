view: data_compare {
  derived_table: {
    sql: SELECT
        *
      FROM (
        SELECT
          this.dt,
          this.col_nm,
          this_month,
          before,
          compare
        FROM (
          SELECT
            bf.dt,
            bf.col_nm,
            before,
            compare
          FROM (
            SELECT
              dt,
              CASE
                WHEN col_nm LIKE 'ls%' THEN REPLACE(col_nm,'ls_','')
              ELSE
              col_nm
            END
              AS col_nm,
              col_val AS before
            FROM
              project_b_team.bm_f_subway_data_compare
            WHERE
              col_nm LIKE 'ls_%') bf
          JOIN (
            SELECT
              dt,
              CASE
                WHEN col_nm LIKE 'compare%' THEN REPLACE(col_nm,'compare_','')
              ELSE
              col_nm
            END
              AS col_nm,
              col_val AS compare
            FROM
              project_b_team.bm_f_subway_data_compare
            WHERE
              col_nm LIKE 'compare_%') com
          ON
            bf.dt = com.dt
            AND bf.col_nm = com.col_nm)bfcom
        JOIN (
          SELECT
            dt,
            col_nm,
            col_val AS this_month
          FROM
            project_b_team.bm_f_subway_data_compare
          WHERE
            col_nm IN ('get_cnt',
              'get_off_cnt',
              'moving_passenger_cnt',
              'sunsusong_cnt')) this
        ON
          bfcom.dt = this.dt
          AND bfcom.col_nm = this.col_nm )
      ORDER BY
        dt,
        col_nm
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dt {
    type: date
    datatype: date
    sql: ${TABLE}.dt ;;
  }

  dimension: col_nm {
    type: string
    sql: ${TABLE}.col_nm ;;
  }

  dimension: this_month {
    type: number
    sql: ${TABLE}.this_month ;;
  }

  dimension: before {
    type: number
    sql: ${TABLE}.before ;;
  }

  dimension: compare {
    type: number
    sql: ${TABLE}.compare ;;
  }

  set: detail {
    fields: [dt, col_nm, this_month, before, compare]
  }
}
