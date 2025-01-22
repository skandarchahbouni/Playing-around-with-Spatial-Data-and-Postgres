SELECT * FROM trajectories;

CREATE TABLE trajectories_cleaned AS
SELECT DISTINCT ON (user_id, timestamp)
    user_id, longitude, latitude, timestamp
FROM trajectories
ORDER BY user_id, timestamp, id;

CREATE TABLE trajectories_mobilityDB AS
SELECT
    user_id,
    tgeompointseq(
        ARRAY_AGG(
            tgeompoint(ST_SetSRID(ST_MakePoint(longitude, latitude), 4326), timestamp) 
            ORDER BY timestamp
        )
    ) AS trajectory_geom
FROM trajectories_cleaned
GROUP BY user_id;


-- Calculate Total Distance in Meters
SELECT
 user_id,
 ST_Distance(
 ST_SetSRID(ST_MakePoint(ST_X(startValue(trajectory_geom)), ST_Y(startValue(trajectory_geom))), 4326)::geography,
 ST_SetSRID(ST_MakePoint(ST_X(endValue(trajectory_geom)), ST_Y(endValue(trajectory_geom))), 4326)::geography
 ) AS total_distance_meters
FROM trajectories_mobilityDB;

-- Calculate Total Duration of Trips
SELECT
 user_id,
 duration(trajectory_geom) AS total_duration
FROM trajectories_mobilityDB;

-- Maximum and Minimum Speeds
SELECT
 user_id,
 maxValue(speed(trajectory_geom)) AS max_speed,
 minValue(speed(trajectory_geom)) AS min_speed
FROM trajectories_mobilityDB;

