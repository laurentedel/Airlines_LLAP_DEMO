USE airline_ontime ; 

ADD JAR /usr/hdp/current/hive-client/lib/hive-serde.jar;
DROP TABLE IF EXISTS flights_raw PURGE;
DROP TABLE IF EXISTS airports_raw PURGE;
DROP TABLE IF EXISTS airlines_raw PURGE;
DROP TABLE IF EXISTS planes_raw PURGE;

CREATE TABLE flights_raw (
  Year int,
  Month int,
  DayofMonth int,
  DayOfWeek int,
  DepTime  int,
  CRSDepTime int,
  ArrTime int,
  CRSArrTime int,
  UniqueCarrier String,
  FlightNum int,
  TailNum String,
  ActualElapsedTime int,
  CRSElapsedTime int,
  AirTime int,
  ArrDelay int,
  DepDelay int,
  Origin String,
  Dest String,
  Distance int,
  TaxiIn int,
  TaxiOut int,
  Cancelled int,
  CancellationCode String,
  Diverted String,
  CarrierDelay int,
  WeatherDelay int,
  NASDelay int,
  SecurityDelay int,
  LateAircraftDelay int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar"     = '"',
  "escapeChar"    = "\\"
)
STORED AS textfile
TBLPROPERTIES ("skip.header.line.count"="1")
;

CREATE TABLE airports_raw (
  iata string,
  airport string,
  city string,
  state double,
  country string,
  lat double,
  lon double
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar"     = '"',
  "escapeChar"    = "\\"
)
STORED AS textfile
TBLPROPERTIES ("skip.header.line.count"="1")
;

CREATE TABLE airlines_raw (
  code string,
  description string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar"     = '"',
  "escapeChar"    = "\\"
)
STORED AS textfile
TBLPROPERTIES ("skip.header.line.count"="1")
;

CREATE TABLE planes_raw (
  tailnum string,
  owner_type string,
  manufacturer string,
  issue_date string,
  model string,
  status string,
  aircraft_type string,
  engine_type string,
  year int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
  "separatorChar" = ",",
  "quoteChar"     = '"',
  "escapeChar"    = "\\"
 )
STORED AS textfile
TBLPROPERTIES ("skip.header.line.count"="1")
;
