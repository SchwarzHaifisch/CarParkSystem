package pl.coderslab.Car;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import pl.coderslab.Client.Client;
import pl.coderslab.Reservation.Reservation;

import java.util.List;

@Entity
@Table(name = "cars")
@Getter
@Setter
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String brand;
    private String model;
    private String licencePlates;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @OneToMany(mappedBy = "car")
    private List<Reservation> reservations;
}
