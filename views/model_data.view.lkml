# The name of this view in Looker is "Model Data"
view: model_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `crime_datav2.Model data` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "County" in Explore.

  dimension: county_map {
    type: string
    map_layer_name: us_counties_fips
    sql: ${TABLE}.FIPS ;;
  }


  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }

  dimension: fips {
    type: number
    sql: ${TABLE}.FIPS ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_fips {
    type: sum
    sql: ${fips} ;;  }
  measure: average_fips {
    type: average
    sql: ${fips} ;;  }

  dimension: percent_9th {
    type: number
    sql: ${TABLE}.Percent_9th ;;
  }

  dimension: percent_ba {
    type: number
    sql: ${TABLE}.Percent_BA ;;
  }

  dimension: percent_hs {
    type: number
    sql: ${TABLE}.Percent_HS ;;
  }

  dimension: recidivism_rate {
    type: number
    sql: ${TABLE}.Recidivism_Rate ;;
  }
  measure: count {
    type: count
  }
}
