package pl.coderslab.client;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import pl.coderslab.car.Car;
import pl.coderslab.company.Company;
import pl.coderslab.reservation.Reservation;

import java.util.List;

@Entity
@Table(name = "client")
@Getter
@Setter
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(length = 20)
    private String firstName;
    @Column(length = 40)
    private String lastName;
    @Column(length = 50)
    private String email;
    @Column(length = 15)
    private String phoneNumber;
    @Column(length = 100)
    private String homeAddress;
    @OneToMany(mappedBy = "client")
    private List<Reservation> reservations;
    @OneToMany(mappedBy = "client")
    private List<Car> cars;
    @ManyToOne
    @JoinColumn(name = "company_id")
    private Company company;
}
