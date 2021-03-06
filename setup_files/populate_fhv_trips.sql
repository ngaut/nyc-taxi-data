INSERT INTO fhv_trips (
  dispatching_base_num, pickup_datetime, dropoff_datetime, pickup_location_id,
  dropoff_location_id, shared_ride
)
SELECT
  trim(upper(dispatching_base_num)),
  pickup_datetime::timestamp without time zone,
  dropoff_datetime::timestamp without time zone,
  NULLIF(pickup_location_id, '')::integer,
  NULLIF(dropoff_location_id, '')::integer,
  NULLIF(shared_ride, '')::integer
FROM fhv_trips_staging;

TRUNCATE TABLE fhv_trips_staging;
