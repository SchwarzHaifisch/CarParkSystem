package pl.coderslab.admin;

import lombok.Getter;
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.client.Client;
import pl.coderslab.client.ClientRepository;
import pl.coderslab.company.Company;
import pl.coderslab.company.CompanyRepository;
import pl.coderslab.reservation.Reservation;
import pl.coderslab.reservation.ReservationController;
import pl.coderslab.reservation.ReservationRepository;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final ReservationRepository reservationRepository;
    private final ClientRepository clientRepository;
    private final CompanyRepository companyRepository;

    public AdminController(ReservationRepository reservationRepository, ClientRepository clientRepository, CompanyRepository companyRepository) {
        this.reservationRepository = reservationRepository;
        this.clientRepository = clientRepository;
        this.companyRepository = companyRepository;
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @GetMapping("/main")
    public String mainAdminPage(Model model) {
        List<Reservation> reservationList = reservationRepository.findAll();
        List<Reservation> today = new ArrayList<>();
        int counterParkIn = 0;
        LocalDateTime now = LocalDateTime.now();
        for (Reservation reservation : reservationList) {
            Duration duration = Duration.between(reservation.getEnterParking(), now);
            long daysDifference = duration.toDays();
            if (daysDifference == 0 && "Potwierdzona".equals(reservation.getStatus())) {
                counterParkIn++;
                today.add(reservation);
            }
        }
        int counterParkOut = 0;
        for (Reservation reservation : reservationList) {
            Duration duration = Duration.between(reservation.getOutParking(), now);
            long daysDifference = duration.toDays();
            if (daysDifference == 0) {
                counterParkOut++;
            }
        }
        int counterToConfirm = 0;
        for (Reservation reservation : reservationList) {
            if ("Niepotwierdzona".equals(reservation.getStatus()) && reservation.getEnterParking().isAfter(LocalDateTime.now())) {
                counterToConfirm++;
            }
        }
        List<String> reservationNotes = new ArrayList<>();
        for (Reservation reservation : reservationList) {
            String notes = generateReservationNotes(reservation);
            reservationNotes.add(notes);
        }

        model.addAttribute("reservationNotes", reservationNotes);
        model.addAttribute("counterParkingIn", counterParkIn);
        model.addAttribute("counterParkingOut", counterParkOut);
        model.addAttribute("counterToConfirm", counterToConfirm);
        model.addAttribute("reservations", today);
        return "admin/adminDashboard";
    }

    @PostMapping("/markEnter")
    public String clientHasEnterdParking(@RequestParam("id") Long id) {
        reservationRepository.updateStatusAfterEnter(id, "W trakcie realizacji");
        return "redirect:/admin/main";
    }

    @PostMapping("/edit")
    public String redirectToEditReservation(@RequestParam("idEdit") Long id, Model model) {
        Reservation reservation = reservationRepository.findById(id).orElseThrow();
        model.addAttribute("reservation", reservation);
        return "/admin/adminEditReservation";
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
                                        Model model){
        String entryDate1 = entryDate.replace("T", " ");
        String outDate1 =outDate.replace("T", " ");
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
        model.addAttribute("errors",errors);
        return "redirect:/admin/edit";
    }

    private String generateReservationNotes(Reservation reservation) {
        String notes = "";
        if ("onsite".equals(reservation.getPayment())) {
            notes += "Pobierz od klienta płatność \n";
        }
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