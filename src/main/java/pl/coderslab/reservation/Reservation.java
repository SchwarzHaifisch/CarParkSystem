package pl.coderslab.Reservation;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import pl.coderslab.Car.Car;
import pl.coderslab.Client.Client;

import java.time.LocalDateTime;

@Entity
@Table(name = "reservations")
@Getter
@Setter
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;
    private String status;
    @Column(updatable = false)
    private LocalDateTime created;
    private LocalDateTime enterParking;
    private LocalDateTime outParking;
    private String payment;
    @ManyToOne
    @JoinTable(
            name = "reservation_car",
            joinColumns = @JoinColumn(name = "reservation_id"),
            inverseJoinColumns = @JoinColumn(name = "car_id", unique = true))
    private Car car;

    @PrePersist
    private void prePersist() {
        this.created = LocalDateTime.now();
    }
}