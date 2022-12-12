import flatpickr from "flatpickr";

const initFlatPickr = () => {
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');

  if (startDateInput) {
    const unavailableDates = JSON.parse(document.querySelector('#car-booking-dates').dataset.unavailable)
    endDateInput.disabled = true
    flatpickr(startDateInput, {
      minDate: "today",
      disable: unavailableDates,
      dateFormat: "Y-m-d",
    });

    startDateInput.addEventListener("change", (e) => {
      if (startDateInput != "") {
        endDateInput.disabled = false
      }
      flatpickr(endDateInput, {
        minDate: e.target.value,
        disable: unavailableDates,
        dateFormat: "Y-m-d"
      });
    })
  };
}

export { initFlatPickr };
