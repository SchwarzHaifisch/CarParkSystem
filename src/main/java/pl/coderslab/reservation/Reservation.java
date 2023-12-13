package pl.coderslab.reservation;

import jakarta.persistence.*;
import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import pl.coderslab.car.Car;
import pl.coderslab.client.Client;

import java.time.Duration;
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
    @Column(length = 15)
    private String status;
    @Column(columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP", updatable = false)
    private LocalDateTime created;
    @NotNull(message = "Proszę wybrać poprawną datę")
    @Future(message = "Data wyjścia z parkingu musi być w przyszłości")
    private LocalDateTime enterParking;
    @NotNull(message = "Proszę wybrać poprawną datę")
    @Future(message = "Data wyjścia z parkingu musi być w przyszłości")
    private LocalDateTime outParking;
    private String payment;
    private Integer price;
    @ManyToOne
    @JoinColumn(name = "car_id")
    private Car car;

    @PrePersist
    private void prePersist() {
        this.created = LocalDateTime.now();
    }

    @PreUpdate
    private void preUpdate() {
        if (enterParking != null && outParking != null) {
            Duration duration = Duration.between(enterParking, outParking);
            long days = duration.toDays();
            price = (int) (days * 15);
        }
    }
    @AssertTrue(message = "Data wyjścia z parkingu musi być po dacie wejścia")
    private boolean isValidDates() {
        return outParking == null || outParking.isAfter(enterParking);
    }
}