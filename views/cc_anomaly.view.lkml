view: cc_anomaly {
  sql_table_name: `cc_anomaly_demo.cc_anomaly`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: anomaly_label {
    type: number
    sql: ${TABLE}.ANOMALY_LABEL ;;
  }

  dimension: anomaly_score {
    type: number
    sql: ${TABLE}.ANOMALY_SCORE ;;
  }

  dimension: cat_descr {
    type: string
    sql: ${TABLE}.CAT_DESCR ;;
  }

  dimension: dept_name {
    type: string
    sql: ${TABLE}.DEPT_NAME ;;
  }

  dimension: div_name {
    type: string
    sql: ${TABLE}.DIV_NAME ;;
  }

  dimension: fiscal_period {
    type: number
    sql: ${TABLE}.FISCAL_PERIOD ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.FISCAL_YEAR ;;
  }

  dimension: merchandise_amt {
    type: number
    sql: ${TABLE}.MERCHANDISE_AMT ;;
  }

  dimension: merchant {
    type: string
    sql: ${TABLE}.MERCHANT ;;
  }

  dimension_group: trans_dt {
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
    sql: ${TABLE}.TRANS_DT ;;
  }

  measure: count {
    type: count
    drill_fields: [id, dept_name, div_name]
  }

  measure: total_anomalies {
    sql: ${anomaly_label} ;;
    type: sum
  }
}
