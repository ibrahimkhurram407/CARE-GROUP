<?php
// availability_picker.php
include('include/config.php');
session_start();
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
// Check if the doctor_id parameter is set
if (isset($_SESSION['dID'])) {
    $doctorId = $_SESSION['dID'];

    // Handle form submission
    $selectedDays = $_GET['days'];
    $selectedWeeks = $_GET['weeks'];
    $selectedMonths = $_GET['months'];

    // Output the selected days, weeks, and months for debugging
    echo "Selected Days: " . print_r($selectedDays, true) . "<br>";
    echo "Selected Weeks: " . print_r($selectedWeeks, true) . "<br>";
    echo "Selected Months: " . print_r($selectedMonths, true) . "<br>";


    // Get the current date
    $currentDate = date('Y-m-d');

    // Get the date of 1st January of next year
    $nextYearDate = date('Y-m-d', strtotime('first day of January next year'));

    // Check the date range and output for debugging
    echo "Start Date: $startDate<br>";
    echo "End Date: $endDate<br>";
    echo "Current Date: $currentDate<br>";
    // Generate an array of dates from the current date to 1st January of next year
    $availableDates = generateDatesArray($currentDate, $nextYearDate, $selectedDays, $selectedWeeks, $selectedMonths);

    // Output the selected days, weeks, months, and available dates for debugging
    echo "Selected Days: " . print_r($selectedDays, true) . "<br>";
    echo "Selected Weeks: " . print_r($selectedWeeks, true) . "<br>";
    echo "Selected Months: " . print_r($selectedMonths, true) . "<br>";
    echo "Available Dates: " . print_r($availableDates, true) . "<br>";

    // Insert dates into the database
    foreach ($availableDates as $date) {
        $insertQuery = "INSERT INTO availabilitytb (doctor_id, date) VALUES ('$doctorId', '$date')";
        $insertResult = mysqli_query($con, $insertQuery);
    
        // Check for success or handle errors as needed
        if (!$insertResult) {
            echo "Error inserting date $date: " . mysqli_error($con) . "<br>";
        } else {
            echo "Successfully inserted date $date<br>";
        }
    }
    
}else{
    echo "no ID in session";
}

// Function to generate an array of dates based on selected days, weeks, and months
function generateDatesArray($startDate, $endDate, $selectedDays, $selectedWeeks, $selectedMonths) {
    $datesArray = [];

    // Loop through each day from the start date to the end date
    for ($currentDate = strtotime($startDate); $currentDate <= strtotime($endDate); $currentDate = strtotime('+1 day', $currentDate)) {
        $currentDay = date('l', $currentDate);
        $currentWeek = ceil(date('d', $currentDate) / 7);
        $currentMonth = date('F', $currentDate);

        // Check if the current day, week, and month are selected
        $dayMatch = empty($selectedDays) || in_array($currentDay, (array)$selectedDays);
        $weekMatch = empty($selectedWeeks) || in_array($currentWeek, (array)$selectedWeeks);
        $monthMatch = empty($selectedMonths) || in_array($currentMonth, (array)$selectedMonths);

        if ($dayMatch && $weekMatch && $monthMatch) {
            $datesArray[] = date('Y-m-d', $currentDate);
        }
    }

    return $datesArray;
}

?>
