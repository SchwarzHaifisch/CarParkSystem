package pl.coderslab.reservation;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.car.Car;
import pl.coderslab.car.CarRepository;
import pl.coderslab.carBrands.CarBrand;
import pl.coderslab.carBrands.CarBrandsRepository;
import pl.coderslab.client.Client;
import pl.coderslab.client.ClientRepository;
import pl.coderslab.company.Company;
import pl.coderslab.company.CompanyRepository;
import pl.coderslab.finalReservationForm.FinalReservationForm;
import pl.coderslab.reservationHistory.ReservationHistory;
import pl.coderslab.reservationHistory.ReservationHistoryRepository;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
    private final ReservationRepository reservationRepository;
    private final CarBrandsRepository carBrandsRepository;
    private final CompanyRepository companyRepository;
    private final ClientRepository clientRepository;
    private final CarRepository carRepository;
    private final ReservationHistoryRepository reservationHistoryRepository;

    public ReservationController(ReservationRepository reservationRepository, CarBrandsRepository carBrandsRepository, CompanyRepository companyRepository, ClientRepository clientRepository, CarRepository carRepository, ReservationHistoryRepository reservationHistoryRepository) {
        this.reservationRepository = reservationRepository;
        this.carBrandsRepository = carBrandsRepository;
        this.companyRepository = companyRepository;
        this.clientRepository = clientRepository;
        this.carRepository = carRepository;
        this.reservationHistoryRepository = reservationHistoryRepository;
    }

    @RequestMapping("/newReservation")
    public String selectDate() {
        return "reservation/newReservationChooseDate";
    }

    @PostMapping("/saveDate")
    public String createInitialReservation(@RequestParam("enterParking") String enterParking,
                                           @RequestParam("outParking") String outParking,
                                           Model model) {
        if (outParking == null || enterParking == null || outParking.isEmpty() || enterParking.isEmpty()) {
            String parkingError = "Proszę wprowadzić poprawne daty";
            model.addAttribute("parkingError", parkingError);
            return "reservation/newReservationChooseDate";
        }


        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime enterParking1 = LocalDateTime.parse(enterParking, formatter);
        LocalDateTime outParking1 = LocalDateTime.parse(outParking, formatter);

        if (outParking1.isBefore(enterParking1) || enterParking1.isBefore(LocalDateTime.now())) {
            String parkingError = "Proszę wprowadzić poprawne daty";
            model.addAttribute("parkingError", parkingError);
            return "reservation/newReservationChooseDate";
        }
        if (Duration.between(enterParking1,outParking1).toDays() == 0) {
            String parkingError = "Proszę wprowadzić poprawne daty";
            model.addAttribute("parkingError", parkingError);
            return "reservation/newReservationChooseDate";
        }
        Reservation reservation = new Reservation();
        reservation.setEnterParking(enterParking1);
        reservation.setOutParking(outParking1);
        Long price = Duration.between(enterParking1, outParking1).toDays() * 15;
        reservation.setPrice(price);
        Reservation savedReservation = reservationRepository.save(reservation);
        Long reservationId = savedReservation.getId();
        List<CarBrand> carBrands = carBrandsRepository.findAll();
        model.addAttribute("reservationId", reservationId);
        model.addAttribute("enterParking", enterParking1.format(formatter));
        model.addAttribute("outParking", outParking1.format(formatter));
        model.addAttribute("price", price);
        model.addAttribute("carBrands", carBrands);
        return "reservation/newReservationDetails";
    }


    @PostMapping("/saveFinalReservation")
    public String createFinalReservation(@Valid FinalReservationForm finalReservationForm,
                                         BindingResult bindingResult,
                                         Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("outParking", finalReservationForm.getOutParking());
            model.addAttribute("enterParking", finalReservationForm.getEnterParking());

            if (finalReservationForm.getEnterParking() != null && finalReservationForm.getOutParking() != null) {
                Long price = Duration.between(finalReservationForm.getEnterParking(), finalReservationForm.getOutParking()).toDays() * 15;
                model.addAttribute("price", price);
            }

            model.addAttribute("validationErrors", bindingResult.getAllErrors());
            return "reservation/newReservationDetails";
        }

        Client client = new Client();
        Company company = new Company();
        Car car = new Car();
        ReservationHistory reservationHistory = new ReservationHistory();
        client.setFirstName(finalReservationForm.getFirstName());
        client.setLastName(finalReservationForm.getLastName());
        client.setEmail(finalReservationForm.getEmail());
        client.setHomeAddress(finalReservationForm.getHomeAdress());
        client.setPhoneNumber(finalReservationForm.getPhoneNumber());
        company.setName(finalReservationForm.getCompanyName());
        company.setAddress(finalReservationForm.getCompanyAdress());
        company.setNip(finalReservationForm.getCompanyNip());
        car.setBrand(finalReservationForm.getCarBrand());
        car.setLicencePlates(finalReservationForm.getNumberPlates());
        Company savedCompany = companyRepository.save(company);
        client.setCompany(savedCompany);
        Client savedClient = clientRepository.save(client);
        car.setClient(client);
        Car savedCar = carRepository.save(car);
        Long reservationId = finalReservationForm.getReservationId();
        String paymentMethod = finalReservationForm.getPaymentMethod();
        String status = "Niepotwierdzona";
        reservationRepository.updateFieldsById(reservationId, status, savedCar.getId(), savedClient.getId(), paymentMethod);
        reservationHistory.setCar(car);
        reservationHistory.setClient(client);
        reservationHistory.setCompany(company);
        reservationHistory.setReservation(reservationRepository.findById(reservationId).orElseThrow());
        return "reservation/finalPage";
    }

}