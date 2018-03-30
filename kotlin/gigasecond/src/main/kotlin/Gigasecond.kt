import java.time.LocalDate
import java.time.LocalDateTime
import java.time.Month

class Gigasecond {
  val date: LocalDateTime

  constructor(time: LocalDate) {
    date = time.atStartOfDay().plusSeconds(1000000000)
  }

  constructor(time: LocalDateTime) {
    date = time.plusSeconds(1000000000)
  }
}