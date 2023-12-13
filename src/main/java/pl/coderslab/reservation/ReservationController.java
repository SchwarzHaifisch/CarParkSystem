package pl.coderslab.reservation;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.awt.print.Book;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
    private final ReservationRepository reservationRepository;

    public ReservationController(ReservationRepository reservationRepository) {
        this.reservationRepository = reservationRepository;
    }

    @RequestMapping("/newReservation")
    public String selectDate(){
        return "newReservationChooseDate";
    }

    @PostMapping("/saveDate")
    public String createInitialReservation(@RequestParam("enterParking") /*@Valid*/ LocalDateTime enterParking,
                                           @RequestParam("outParking") /*@Valid*/ LocalDateTime outParking,
//                                           BindingResult bindingResult,
                                           Model model) {

//        if (bindingResult.hasErrors()) {
//            model.addAttribute("enterParkingError", bindingResult.getFieldError("enterParking"));
//            model.addAttribute("outParkingError", bindingResult.getFieldError("outParking"));
//            return "newReservationChooseDate";
//        }

        Reservation reservation = new Reservation();
        reservation.setEnterParking(enterParking);
        reservation.setOutParking(outParking);
        Reservation savedReservation = reservationRepository.save(reservation);
        Long reservationId = savedReservation.getId();
        model.addAttribute("reservationId", reservationId);
        return "homePage";
    }




}
