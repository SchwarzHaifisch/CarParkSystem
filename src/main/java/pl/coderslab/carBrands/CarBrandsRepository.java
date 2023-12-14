package pl.coderslab.carBrands;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.car.Car;

public interface CarBrandsRepository extends JpaRepository<CarBrand, Long> {
}
