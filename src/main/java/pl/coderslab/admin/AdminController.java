package pl.coderslab.admin;

import lombok.Getter;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.car.Car;
import pl.coderslab.car.CarRepository;
import pl.coderslab.client.Client;
import pl.coderslab.client.ClientRepository;
import pl.coderslab.company.Company;
import pl.coderslab.company.CompanyRepository;
import pl.coderslab.reservation.Reservation;
import pl.coderslab.reservation.ReservationController;
import pl.coderslab.reservation.ReservationRepository;
import pl.coderslab.reservationHistory.ReservationHistory;
import pl.coderslab.reservationHistory.ReservationHistoryRepository;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final ReservationRepository reservationRepository;
    private final ClientRepository clientRepository;
    private final CompanyRepository companyRepository;
    private final CarRepository carRepository;
    private final ReservationHistoryRepository reservationHistoryRepository;

    public AdminController(ReservationRepository reservationRepository, ClientRepository clientRepository, CompanyRepository companyRepository, CarRepository carRepository, ReservationHistoryRepository reservationHistoryRepository) {
        this.reservationRepository = reservationRepository;
        this.clientRepository = clientRepository;
        this.companyRepository = companyRepository;
        this.carRepository = carRepository;
        this.reservationHistoryRepository = reservationHistoryRepository;
    }


//    @GetMapping("/main")
//    public String mainAdminPage(Model model) {
//        List<Reservation> today = reservationRepository.getReservationToday();
//        int counterParkIn = today.size();
//        List<Reservation> goingOutParking = reservationRepository.getReservationTodayOutParking();
//        int counterParkOut = goingOutParking.size();
//        List<Reservation> unconfirmed = reservationRepository.getReservationUnConfirmed();
//        int counterToConfirm = unconfirmed.size();
//        List<String> reservationNotes = new ArrayList<>();
//        for (Reservation reservation : today) {
//            String notes = generateReservationNotes(reservation);
//            reservationNotes.add(notes);
//        }
//
//        model.addAttribute("reservationNotes", reservationNotes);
//        model.addAttribute("counterParkingIn", counterParkIn);
//        model.addAttribute("counterParkingOut", counterParkOut);
//        model.addAttribute("counterToConfirm", counterToConfirm);
//        model.addAttribute("reservations", today);
//        return "admin/adminDashboard";
//    }

    @GetMapping("/main")
    public String mainAdminPage(Model model) {
        List<Reservation> today = reservationRepository.getReservationToday();
        int counterParkIn = today.size();
        List<Reservation> goingOutParking = reservationRepository.getReservationTodayOutParking();
        int counterParkOut = goingOutParking.size();
        List<Reservation> unconfirmed = reservationRepository.getReservationUnConfirmed();
        int counterToConfirm = unconfirmed.size();
        List<String> reservationNotes = today.stream()
                .map(this::generateReservationNotes)
                .collect(Collectors.toList());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
        today.forEach(reservation -> {
            if (reservation.getEnterParking() != null) {
                reservation.setEnterParkingFormatted(reservation.getEnterParking().format(formatter));
            }
        });
        today.sort(Comparator.comparing(reservation -> {
            if (reservation.getEnterParking() != null) {
                return reservation.getEnterParking();
            }
            return LocalDateTime.MIN;
        }));
        model.addAttribute("reservationNotes", reservationNotes);
        model.addAttribute("counterParkingIn", counterParkIn);
        model.addAttribute("counterParkingOut", counterParkOut);
        model.addAttribute("counterToConfirm", counterToConfirm);
        model.addAttribute("reservations", today);
        return "admin/adminDashboard";
    }


    @PostMapping("/markEnter")
    public String clientHasEnterdParking(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        reservationRepository.updateStatus(id, "W trakcie realizacji");
        redirectAttributes.addFlashAttribute("successMessage", "Potwierdzono przyjazd klienta");
        return "redirect:/admin/main";
    }

    @PostMapping("/confirmed")
    public String confirmFutureReservation(@RequestParam("idCon") Long id, RedirectAttributes redirectAttributes) {
        reservationRepository.updateStatus(id, "Potwierdzona");
        redirectAttributes.addFlashAttribute("successMessage", "Potwierdzono rezerwację");
        return "redirect:/admin/confirmReservations";
    }

    @PostMapping("/denied")
    public String deniedFutureReservation(@RequestParam("idDen") Long id, RedirectAttributes redirectAttributes) {
        reservationRepository.updateStatus(id, "Odrzucona");
        redirectAttributes.addFlashAttribute("successMessage", "Rezerwacja została odrzucona");
        return "redirect:/admin/confirmReservations";
    }

    @GetMapping("/edit")
    public String redirectToEditReservation(@RequestParam("idEdit") Long id, Model model) {
        Reservation reservation = reservationRepository.findById(id).orElseThrow();
        model.addAttribute("reservation", reservation);
        return "admin/adminEditReservation";
    }

    @PostMapping("/clientOutOfParking")
    public String clientOutOfParking(@RequestParam("idOfPark") Long id, RedirectAttributes redirectAttributes) {
        reservationRepository.updateStatus(id, "Zakończona");
        redirectAttributes.addFlashAttribute("successMessage", "Odznaczono wyjazd klienta");
        return "redirect:/admin/outParking";
    }

    @PostMapping("/editConfirm")
    public String handleEditConfirmForm(@RequestParam("planId") Long planId,
                                        @RequestParam("entryDate") String entryDate,
                                        @RequestParam("outDate") String outDate,
                                        @RequestParam("newPrice") String newPrice,
                                        @RequestParam("newStatus") String newStatus,
                                        @RequestParam("newEmail") String newEmail,
                                        @RequestParam("newFirstName") String newFirstName,
                                        @RequestParam("newLastName") String newLastName,
                                        @RequestParam("newHomeAddress") String newHomeAddress,
                                        @RequestParam("newPhoneNumber") String newPhoneNumber,
                                        @RequestParam("newCompanyName") String newCompanyName,
                                        @RequestParam("newCompanyAddress") String newCompanyAddress,
                                        @RequestParam("newCompanyNip") String newCompanyNip,
                                        Model model,
                                        RedirectAttributes redirectAttributes) {
        String entryDate1 = entryDate.replace("T", " ");
        String outDate1 = outDate.replace("T", " ");
        List<String> errors = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        Reservation reservation = reservationRepository.findById(planId).orElseThrow();
        reservation.setEnterParking(LocalDateTime.parse(entryDate1, formatter));
        reservation.setOutParking(LocalDateTime.parse(outDate1, formatter));
        if (newPrice.matches("\\d+")) {
            reservation.setPrice(Long.parseLong(newPrice));
        } else {
            errors.add("Kwota musi być liczbą");
        }
        reservation.setStatus(newStatus);
        Client client = reservation.getClient();
        client.setEmail(newEmail);
        client.setFirstName(newFirstName);
        client.setLastName(newLastName);
        client.setHomeAddress(newHomeAddress);
        if (newPrice.matches("\\d+")) {
            client.setPhoneNumber(newPhoneNumber);
        } else {
            errors.add("Numer telefonu musi być liczbą bez dodatkowych znaków");
        }
        Company company = client.getCompany();
        company.setName(newCompanyName);
        company.setAddress(newCompanyAddress);
        company.setNip(newCompanyNip);
        reservationRepository.save(reservation);
        clientRepository.save(client);
        companyRepository.save(company);
        model.addAttribute("errors", errors);
        redirectAttributes.addFlashAttribute("successMessage", "Edycja została zapisana.");
        return "redirect:/admin/edit?idEdit=" + planId;
    }

    //    @RequestMapping("/confirmReservations")
//    public String redirectToConfirmReservation(Model model) {
//        List<Reservation> reservationList = reservationRepository.getReservationUnConfirmed();
//        model.addAttribute("reservationsList", reservationList);
//        return "admin/adminConfirmReservations";
//    }
    @RequestMapping("/confirmReservations")
    public String redirectToConfirmReservation(Model model) {
        List<Reservation> reservationList = reservationRepository.getReservationUnConfirmed();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        reservationList.forEach(reservation -> {
            if (reservation.getEnterParking() != null) {
                reservation.setEnterParkingFormatted(reservation.getEnterParking().format(formatter));
            }

            if (reservation.getOutParking() != null) {
                reservation.setOutParkingFormatted(reservation.getOutParking().format(formatter));
            }
        });
        reservationList.sort(Comparator.comparing(reservation -> {
            if (reservation.getEnterParking() != null) {
                return reservation.getEnterParking();
            }
            return LocalDateTime.MIN;
        }));
        model.addAttribute("reservationsList", reservationList);
        return "admin/adminConfirmReservations";
    }


    @GetMapping("/outParking")
    public String clientGoOutOfTheParkingRedirect(Model model) {
        List<Reservation> reservationList = reservationRepository.getReservationTodayOutParking();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        reservationList.forEach(reservation -> {
            if (reservation.getOutParking() != null) {
                reservation.setOutParkingFormatted(reservation.getOutParking().format(formatter));
            }
        });
        reservationList.sort(Comparator.comparing(reservation -> reservation.getOutParking().format(formatter)));
        model.addAttribute("reservationsList", reservationList);
        return "admin/adminMarkClientGoOutOfParking";
    }


    @GetMapping("/allReservations")
    public String getAllReservations(Model model) {
        List<Reservation> reservationList = new ArrayList<>();
        for (Reservation reservation : reservationRepository.findAll()) {
            if (reservation.getStatus() != null) {
                reservationList.add(reservation);
            }
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        reservationList.forEach(reservation -> {
            if (reservation.getEnterParking() != null) {
                reservation.setEnterParkingFormatted(reservation.getEnterParking().format(formatter));
            }
            if (reservation.getOutParking() != null) {
                reservation.setOutParkingFormatted(reservation.getOutParking().format(formatter));
            }
        });
        reservationList.sort(Comparator.comparing(Reservation::getId));
        model.addAttribute("reservationsList", reservationList);
        return "admin/adminShowAllReservations";
    }


    //    @GetMapping("/searchCarToMarkOut")
//    public String findCarByNumberPlater(@RequestParam("searchLicensePlate") String licensePlate, Model model){
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
//        Car car = carRepository.findByLicensePlate(licensePlate).orElseThrow();
//        List<Reservation> reservationList = new ArrayList<>();
//        reservationList.add(reservationRepository.findByCarId(car.getId()).orElseThrow());
//        reservationList.forEach(reservation -> {
//            if (reservation.getOutParking() != null) {
//                reservation.setOutParkingFormatted(reservation.getOutParking().format(formatter));
//            }
//        });
//        model.addAttribute("reservationsList", reservationList);
//        return "admin/adminMarkClientGoOutOfParking";
//    }
    @GetMapping("/searchCarToMarkOut")
    public String findCarByNumberPlater(@RequestParam("searchLicensePlate") String licensePlate, Model model) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        Optional<Car> optionalCar = carRepository.findByLicensePlate(licensePlate);
        if (optionalCar.isPresent()) {
            Car car = optionalCar.get();
            Optional<Reservation> optionalReservation = reservationRepository.findByCarId(car.getId());
            if (optionalReservation.isPresent()) {
                Reservation reservation = optionalReservation.get();
                if (reservation.getOutParking() != null) {
                    reservation.setOutParkingFormatted(reservation.getOutParking().format(formatter));
                }
                List<Reservation> reservationList = new ArrayList<>();
                reservationList.add(reservation);
                model.addAttribute("reservationsList", reservationList);
            } else {
                model.addAttribute("reservationsList", new ArrayList<>());
            }
        } else {
            model.addAttribute("reservationsList", new ArrayList<>());
        }
        return "admin/adminMarkClientGoOutOfParking";
    }

    @GetMapping("/history")
    public String showHistory(Model model) {
        List<ReservationHistory> reservationList = new ArrayList<>();
        for (ReservationHistory reservation : reservationHistoryRepository.findAll()) {
            if (reservation.getId() != null) {
                reservationList.add(reservation);
            }
        }
        model.addAttribute("reservationList", reservationList);
        return "admin/adminReservationsHistory";
    }

    @GetMapping("/showDetails")
    public String showDetailsOfHistoryRecord(@RequestParam("idDet") Long id, Model model) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        ReservationHistory reservationHistory = reservationHistoryRepository.findById(id).orElseThrow();
        Reservation reservation = reservationRepository.findById(reservationHistory.getId()).orElseThrow();
        reservation.setEnterParkingFormatted(reservation.getEnterParking().format(formatter));
        reservation.setOutParkingFormatted(reservation.getOutParking().format(formatter));
        reservation.setCreatedFormatted(reservation.getCreated().format(formatter));
        model.addAttribute("reservationHistory", reservation);
        return "admin/adminReservationHistoryDetails";
    }

    private String generateReservationNotes(Reservation reservation) {
        String notes = "";
        if (reservation.getClient() != null) {
            Company company = reservation.getClient().getCompany();
            if (company != null && company.getName() != null &&
                    company.getAddress() != null && company.getNip() != null) {
                notes += "Potwierdź u klienta dane do faktury \n";
            }
            if (company == null || company.getName() == null ||
                    company.getAddress() == null || company.getNip() == null) {
                notes += "Potwierdź u klienta że nie potrzebuje faktury \n";
            }
        }
        return notes;
    }
}