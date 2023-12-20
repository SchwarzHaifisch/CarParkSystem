package pl.coderslab.finalReservationForm;

import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.springframework.cglib.core.Local;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Getter
@Setter
public class FinalReservationForm {
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime enterParking;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime outParking;
    private Long reservationId;
    @NotBlank(message = "Proszę wprowadzić poprawne imię")
    private String firstName;
    @NotBlank(message = "Proszę wprowadzić poprawne nazwisko")
    private String lastName;
    @NotBlank(message = "Proszę wprowadzić poprawny adres e-mail")
    @Email(message = "Proszę wprowadzić poprawny adres e-mail")
    private String email;
    @NotBlank(message = "Proszę wprowadzić poprawny adres zamieszkania")
    private String homeAdress;
    @NotBlank(message = "Proszę wprowadzic poprawny numer telefonu")
    private String phoneNumber;
    @NotBlank
    private String carBrand;
    @NotBlank(message = "Proszę wprowadzić poprawny numer rejestracyjny")
    @Size(min=1,max = 10)
    private String numberPlates;
    private String companyName;
    private String companyAdress;
    private String companyNip;
    @NotBlank
    private String paymentMethod;

    @Override
    public String toString() {
        return "FinalReservationForm{" +
                "reservationId=" + reservationId +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", email='" + email + '\'' +
                ", homeAdress='" + homeAdress + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", carBrand='" + carBrand + '\'' +
                ", numberPlates='" + numberPlates + '\'' +
                ", companyName='" + companyName + '\'' +
                ", companyAdress='" + companyAdress + '\'' +
                ", companyNip='" + companyNip + '\'' +
                '}';
    }
}
