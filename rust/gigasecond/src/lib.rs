extern crate chrono;
use chrono::{DateTime, Utc, Duration};

pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {
  start + Duration::seconds(1000000000)
}
