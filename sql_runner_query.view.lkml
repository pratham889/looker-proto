view: sql_runner_query {
  derived_table: {
    sql: select ((COALESCE(SUM(CASE WHEN (cc_anomaly.ANOMALY_LABEL  = 1) THEN cc_anomaly.MERCHANDISE_AMT ELSE NULL END), 0)) / (COALESCE(SUM(cc_anomaly.MERCHANDISE_AMT), 0)))*100 as Anomaly_percent from cc_anomaly
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: anomaly_percent {
    type: number
    sql: ${TABLE}.Anomaly_percent ;;
  }

  set: detail {
    fields: [anomaly_percent]
  }
}
