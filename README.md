# HOW to Start

To create your own patient and observation, follow these steps:

1. Use the `http_request_patient.py` to manually create your own patient.
2. Use the `http_request_observation.py` to manually create one observation for testing.
3. To send heart rate values to the FHIR server, connect a device that can send data through Bluetooth.
4. Use the `BLEGW.html` to connect your bluetooth device and check, send the Heart Rate value.

---

# HOW to See the Result

To visit the website, use the root link + file's name. For example:

- Input `https://deyif.github.io/FHIRserver_HTTP_HTML/BLEGW_B17.html` to visit the BLEGW page.
- Input `https://deyif.github.io/FHIRserver_HTTP_HTML/graph_B17.html` to visit the plot page.
- Our patient ID is `1123`, so input `https://deyif.github.io/FHIRserver_HTTP_HTML/patientview.html?id=1123` to check our patient's info.

---

**Note:** Make sure your device is properly configured to send heart rate data.
