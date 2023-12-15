package pl.coderslab.car;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import pl.coderslab.client.Client;
import pl.coderslab.reservation.Reservation;

import java.util.List;

@Entity
@Table(name = "car")
@Getter
@Setter
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(length = 20)
    private String brand;
    @Column(length = 9)
    private String licencePlates;
    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @OneToMany(mappedBy = "car")
    private List<Reservation> reservations;

}
