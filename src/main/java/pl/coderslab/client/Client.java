package pl.coderslab.Client;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import pl.coderslab.Car.Car;
import pl.coderslab.Reservation.Reservation;

import java.util.List;

@Entity
@Table(name = "client")
@Getter
@Setter
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;
    private String homeAdress;
    @OneToMany(mappedBy = "client")
    private List<Reservation> reservations;
    @OneToMany(mappedBy = "client")
    private List<Car> cars;
}
