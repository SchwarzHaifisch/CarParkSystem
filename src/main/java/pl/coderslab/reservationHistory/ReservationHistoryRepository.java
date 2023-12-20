package pl.coderslab.reservationHistory;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ReservationHistoryRepository extends JpaRepository<ReservationHistory, Long> {
}
