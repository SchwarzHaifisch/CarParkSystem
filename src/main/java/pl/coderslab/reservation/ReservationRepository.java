package pl.coderslab.reservation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    @Modifying
    @Transactional
    @Query(value = "UPDATE reservations SET status = :field1, car_id = :field2, client_id = :field3, payment = :field4 WHERE id = :id",
            nativeQuery = true)
    void updateFieldsById(@Param("id") Long id, @Param("field1") String field1,
                          @Param("field2") Long field2, @Param("field3") Long field3,
                          @Param("field4") String field4);
    Optional<Reservation> findById(Long id);

    @Modifying
    @Transactional
    @Query(value = "UPDATE reservations SET status = :field1 WHERE id = :id",
            nativeQuery = true)
    void updateStatusAfterEnter(@Param("id") Long id, @Param("field1") String field1);
}
