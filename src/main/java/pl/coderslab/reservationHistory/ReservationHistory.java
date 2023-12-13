package pl.coderslab.reservationHistory;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import pl.coderslab.car.Car;
import pl.coderslab.client.Client;
import pl.coderslab.company.Company;
import pl.coderslab.reservation.Reservation;

import java.time.LocalDateTime;

@Entity
@Table(name = "history")
@Getter
@Setter
public class ReservationHistory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "car_id")
    private Car car;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;

    @ManyToOne
    @JoinColumn(name = "reservation_id")
    private Reservation reservation;

    @Column(name = "reservation_status")
    private String reservationStatus;

    @Column(name = "created")
    private LocalDateTime created;

}