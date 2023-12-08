package pl.coderslab.carBrands;

import jakarta.persistence.*;

@Entity
@Table(name = "carBrands")
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String brandName;
}
