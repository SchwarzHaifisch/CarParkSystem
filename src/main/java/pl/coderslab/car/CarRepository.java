package pl.coderslab.car;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface CarRepository extends JpaRepository<Car,Long> {


    @Transactional
    @Query(value = "SELECT * from car where lower(licence_plates)=lower(:field1);", nativeQuery = true)
    Optional<Car> findByLicensePlate(@Param("field1") String field1);
}
