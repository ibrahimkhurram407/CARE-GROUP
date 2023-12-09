<?php

function generateDatesArray($startDate, $endDate, $selectedDays, $selectedWeeks, $selectedMonths) {
    $datesArray = [];

    // Loop through each day from the start date to the end date
    for ($currentDate = strtotime($startDate); $currentDate <= strtotime($endDate); $currentDate = strtotime('+1 day', $currentDate)) {
        $currentDay = date('l', $currentDate);
        $currentWeek = ceil(date('d', $currentDate) / 7);
        $currentMonth = date('F', $currentDate);

        // Check if the current day, week, or month is selected
        if (in_array($currentDay, $selectedDays) ||
            in_array($currentWeek, $selectedWeeks) ||
            in_array($currentMonth, $selectedMonths)) {
            $datesArray[] = date('Y-m-d', $currentDate);
        }
    }

    // Output the result for debugging
    var_dump($datesArray);

    // Return the array
    return $datesArray;
}

// Example usage
generateDatesArray(date('Y-m-d'), date('Y-m-d', strtotime('first day of January next year')), ["Monday"], [1], ["August"]);
?>
