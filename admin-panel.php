<!DOCTYPE html>
<?php 
include('func.php');  
include('newfunc.php');
include('./include/config.php');


  $pid = $_SESSION['pid'];
  $username = $_SESSION['username'];
  $email = $_SESSION['email'];
  $fname = $_SESSION['fname'];
  $gender = $_SESSION['gender'];
  $lname = $_SESSION['lname'];
  $contact = $_SESSION['contact'];

// Query for Appointments
$check_query_appointments = mysqli_query($con, "SELECT * FROM appointmenttb WHERE fname = '$fname' AND lname = '$lname'");

if ($check_query_appointments === false) {
    // Handle the error, print it for debugging purposes
    echo "Error in Appointments query: " . mysqli_error($con);
} else {
    // Successful query, proceed
    $AmountOfAppointments = mysqli_num_rows($check_query_appointments);
}

// Query for Prescriptions
$check_query_prescriptions = mysqli_query($con, "SELECT * FROM prestb WHERE fname = '$fname' AND lname = '$lname'");

if ($check_query_prescriptions === false) {
    // Handle the error, print it for debugging purposes
    echo "Error in Prescriptions query: " . mysqli_error($con);
} else {
    // Successful query, proceed
    $AmountOfPrescriptions = mysqli_num_rows($check_query_prescriptions);
}


  if (isset($_POST['app-submit'])) {
    $pid = $_SESSION['pid'];
    $username = $_SESSION['username'];
    $email = $_SESSION['email'];
    $fname = $_SESSION['fname'];
    $lname = $_SESSION['lname'];
    $gender = $_SESSION['gender'];
    $contact = $_SESSION['contact'];
    $doctor = $_POST['doctor'];
    $docFees = $_POST['docFees'];
    $appdate = $_POST['appdate'];
    
    // Get the current date
    $cur_date = date("Y-m-d");

    // Convert the appointment date to a timestamp
    $appdate_timestamp = strtotime($appdate);
    // Compare the appointment date with the current date
    if ($appdate_timestamp === false) {
        echo "<script>alert('Invalid date format!');</script>";
    } elseif ($appdate_timestamp >= strtotime($cur_date)) {
        $check_query = mysqli_query($con, "SELECT ID FROM appointmenttb WHERE doctor='$doctor' AND appdate='$appdate'");

        if (mysqli_num_rows($check_query) == 0) {
            $query = mysqli_query($con, "INSERT INTO appointmenttb (pid, fname, lname, gender, email, contact, doctor, docFees, appdate, userStatus, doctorStatus) VALUES ($pid, '$fname', '$lname', '$gender', '$email', '$contact', '$doctor', '$docFees', '$appdate', '1', '1')");

            if ($query) {
                echo "<script>alert('Your appointment successfully booked');</script>";
            } else {
                echo "<script>alert('Unable to process your request. Please try again!');</script>";
            }
        } else {
            echo "<script>alert('We are sorry to inform that the doctor is not available at this time or date. Please choose a different time or date!');</script>";
        }
    } else {
        echo "<script>alert('Select a time or date in the future!');</script>";
    }
}
 elseif (isset($_GET['cancel'])) {
    $query = mysqli_query($con, "update appointmenttb set userStatus='0' where ID = '" . $_GET['ID'] . "'");
    if ($query) {
        echo "<script>alert('Your appointment successfully cancelled');</script>";
    }
}



function generate_bill(){
  include('include/config.php');
  $pid = $_SESSION['pid'];
  $output='';
  $query=mysqli_query($con,"select p.pid,p.ID,p.fname,p.lname,p.doctor,p.appdate,p.disease,p.allergy,p.prescription,a.docFees from prestb p inner join appointmenttb a on p.ID=a.ID and p.pid = '$pid' and p.ID = '".$_GET['ID']."'");
  while($row = mysqli_fetch_array($query)){
    $output .= '
    <label> Patient ID : </label>'.$row["pid"].'<br/><br/>
    <label> Appointment ID : </label>'.$row["ID"].'<br/><br/>
    <label> Patient Name : </label>'.$row["fname"].' '.$row["lname"].'<br/><br/>
    <label> Doctor Name : </label>'.$row["doctor"].'<br/><br/>
    <label> Appointment Date : </label>'.$row["appdate"].'<br/><br/>
    <label> Disease : </label>'.$row["disease"].'<br/><br/>
    <label> Allergies : </label>'.$row["allergy"].'<br/><br/>
    <label> Prescription : </label>'.$row["prescription"].'<br/><br/>
    <label> Fees Paid : </label>'.$row["docFees"].'<br/>
    
    ';

  }
  
  return $output;
}


if(isset($_GET["generate_bill"])){
  require_once("TCPDF/tcpdf.php");
  $obj_pdf = new TCPDF('P',PDF_UNIT,PDF_PAGE_FORMAT,true,'UTF-8',false);
  $obj_pdf -> SetCreator(PDF_CREATOR);
  $obj_pdf -> SetTitle("Generate Bill");
  $obj_pdf -> SetHeaderData('','',PDF_HEADER_TITLE,PDF_HEADER_STRING);
  $obj_pdf -> SetHeaderFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));
  $obj_pdf -> SetFooterFont(Array(PDF_FONT_NAME_MAIN,'',PDF_FONT_SIZE_MAIN));
  $obj_pdf -> SetDefaultMonospacedFont('helvetica');
  $obj_pdf -> SetFooterMargin(PDF_MARGIN_FOOTER);
  $obj_pdf -> SetMargins(PDF_MARGIN_LEFT,'5',PDF_MARGIN_RIGHT);
  $obj_pdf -> SetPrintHeader(false);
  $obj_pdf -> SetPrintFooter(false);
  $obj_pdf -> SetAutoPageBreak(TRUE, 10);
  $obj_pdf -> SetFont('helvetica','',12);
  $obj_pdf -> AddPage();

  $content = '';

  $content .= '
      <br/>
      <h2 align ="center"> CARE GROUP</h2></br>
      <h3 align ="center"> Bill</h3>
      

  ';
 
  $content .= generate_bill();
  $obj_pdf -> writeHTML($content);
  ob_end_clean();
  $obj_pdf -> Output("bill.pdf",'I');

}

function get_specs(){
  include('include/config.php');
  $query=mysqli_query($con,"select username,spec from doctb");
  $docarray = array();
    while($row =mysqli_fetch_assoc($query))
    {
        $docarray[] = $row;
    }
    return json_encode($docarray);
}

?>
<html lang="en">

<head>


    <!-- Required meta tags -->
    <meta charset="utf-8">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
    <!-- Bootstrap CSS -->

    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">








    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
        integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
        <a class="navbar-brand" href="#"><i class="fa fa-user-plus" aria-hidden="true"></i> CARE GROUP </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <style>
        .bg-primary {
            background: -webkit-linear-gradient(left, #3931af, #00c6ff);
        }

        .list-group-item.active {
            z-index: 2;
            color: #fff;
            background-color: #342ac1;
            border-color: #007bff;
        }

        .text-primary {
            color: #342ac1 !important;
        }

        .btn-primary {
            background-color: #3c50c1;
            border-color: #3c50c1;
        }
        </style>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="logout.php"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="account-details.php<?php echo "?table=patreg&page=adminpanel.php&id=" . $pid ?>"><i class="fa fa-user" aria-hidden="true"></i>Edit Account Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"></a>
                </li>
            </ul>
        </div>
    </nav>
</head>
<style type="text/css">
button:hover {
    cursor: pointer;
}

#inputbtn:hover {
    cursor: pointer;
}
</style>

<body style="padding-top:50px;">

    <div class="container-fluid" style="margin-top:50px;">
        <h3 style="margin-left: 40%;  padding-bottom: 20px; font-family: 'IBM Plex Sans', sans-serif;"> Welcome
            &nbsp<?php echo $username ?>
        </h3>
        <div class="row">
            <div class="col-md-4" style="max-width:25%; margin-top: 3%">
                <div class="list-group" id="list-tab" role="tablist">
                    <a class="list-group-item list-group-item-action active" id="list-dash-list" data-toggle="list"
                        href="#list-dash" role="tab" aria-controls="home">Dashboard</a>
                    <a class="list-group-item list-group-item-action" id="list-home-list" data-toggle="list"
                        href="#list-home" role="tab" aria-controls="home">Book Appointment</a>
                    <a class="list-group-item list-group-item-action" href="#app-hist" id="list-pat-list" role="tab"
                        data-toggle="list" aria-controls="home">Appointment History</a>
                    <a class="list-group-item list-group-item-action" href="#list-pres" id="list-pres-list" role="tab"
                        data-toggle="list" aria-controls="home">Prescriptions</a>

                </div><br>
            </div>
            <div class="col-md-8" style="margin-top: 3%;">
                <div class="tab-content" id="nav-tabContent" style="width: 950px;">


                    <div class="tab-pane fade  show active" id="list-dash" role="tabpanel"
                        aria-labelledby="list-dash-list">
                        <div class="container-fluid container-fullw bg-white">
                            <div class="row">
                                <div class="col-sm-4" style="left: 5%">
                                    <div class="panel panel-white no-radius text-center">
                                        <div class="panel-body">
                                            <span class="fa-stack fa-2x"> <i
                                                    class="fa fa-square fa-stack-2x text-primary"></i> <i
                                                    class="fa fa-terminal fa-stack-1x fa-inverse"></i> </span>
                                            <h4 class="StepTitle" style="margin-top: 5%;"> Book My Appointment</h4>
                                            <script>
                                            function clickDiv(id) {
                                                document.querySelector(id).click();
                                            }
                                            </script>
                                            <p class="links cl-effect-1">
                                                <a href="#list-home" onclick="clickDiv('#list-home-list')">
                                                    Book Appointment
                                                </a>
                                            </p>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-sm-4" style="left: 10%">
                                    <div class="panel panel-white no-radius text-center">
                                        <div class="panel-body">
                                            <span class="fa-stack fa-2x"> <i
                                                    class="fa fa-square fa-stack-2x text-primary"></i> <i
                                                    class="fa fa-paperclip fa-stack-1x fa-inverse"></i> </span>
                                            <h4 class="StepTitle" style="margin-top: 5%;">My Appointments</h2>

                                                <p class="cl-effect-1">
                                                    <a href="#app-hist" onclick="clickDiv('#list-pat-list')">
                                                        View Appointment History (<?php echo $AmountOfAppointments; ?>)
                                                    </a>
                                                </p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4" style="left: 20%;margin-top:5%">
                                <div class="panel panel-white no-radius text-center">
                                    <div class="panel-body">
                                        <span class="fa-stack fa-2x"> <i
                                                class="fa fa-square fa-stack-2x text-primary"></i> <i
                                                class="fa fa-list-ul fa-stack-1x fa-inverse"></i> </span>
                                        <h4 class="StepTitle" style="margin-top: 5%;">Prescriptions</h2>

                                            <p class="cl-effect-1">
                                                <a href="#list-pres" onclick="clickDiv('#list-pres-list')">
                                                    View Prescription List (<?php echo $AmountOfPrescriptions; ?>)
                                                </a>
                                            </p>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>

                    <div class="tab-pane fade" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
                        <div class="container-fluid">
                            <div class="card">
                                <div class="card-body">
                                    <center>
                                        <h4>Create an appointment</h4>
                                    </center><br>
                                    <form class="form-group" method="post" action="admin-panel.php">
                                        <div class="row">
                                            <?php
                                              global $con;
                                              $query = "SELECT id, username, city, spec, docFees FROM doctb";
                                              $result = mysqli_query($con, $query);
                                              $data = array();
                                              // Check if there are results
                                              if ($result->num_rows > 0) {
                                                  // Fetch each row and add it to the array
                                                  while ($row = $result->fetch_assoc()) {
                                                      $data[] = $row;
                                                  }
                                              }
                                              
                                              // Convert the PHP array to a JSON string
                                              $doctb = json_encode($data);
                                              $query = "SELECT * FROM availabilitytb;";
                                              $result1 = mysqli_query($con, $query);
                                              $data1 = array();

                                              // Check if there are results
                                              if ($result1->num_rows > 0) {
                                                  // Fetch each row and add it to the array
                                                  while ($row = $result1->fetch_assoc()) {
                                                      $data1[] = $row;
                                                  }
                                              }
                                              
                                              // Convert the PHP array to a JSON string
                                              $availabilitytb = json_encode($data1);
                                              ?>

                                            <div class="col-md-4">
                                                <label for="city">City:</label>
                                            </div>
                                            <div class="col-md-8">
                                                <select name="city" id="city" class="form-control">
                                                    <option value="" disabled selected>Select City</option>
                                                    <?php display_cities($data); ?>
                                                </select>
                                            </div>
                                            <br><br>

                                            <div class="col-md-4">
                                                <label for="spec">Specialization:</label>
                                            </div>
                                            <div class="col-md-8">
                                                <select name="spec" class="form-control" id="spec">
                                                    <option value="" disabled selected>Select Specialization</option>
                                                    <?php display_specs($data); ?>
                                                </select>
                                            </div>
                                            <br><br>
                                            <div class="col-md-4">
                                                <label for="doctor">Doctors:</label>
                                            </div>
                                            <div class="col-md-8">
                                                <select name="doctor" class="form-control" id="doctor"
                                                    required="required">
                                                    <option value="" disabled selected>Select Doctor</option>
                                                    <?php display_docs($data); ?>
                                                </select>
                                            </div><br /><br />
                                            <div class="col-md-4">
                                                <label for="docFees">Consultancy Fees:</label>
                                            </div>
                                            <div class="col-md-8">
                                                <input class="form-control" type="text" name="docFees" id="docFees"
                                                    readonly="readonly" />
                                            </div><br><br>

                                            <div class="col-md-4">
                                                <label for="appdate">Appointment Date:</label>
                                            </div>
                                            <div class="col-md-8">
                                                <!-- <input type="date" class="form-control datepicker" name="appdate" id="appdate"
                                                    required="required"> -->
                                                <select class="form-control" id="appdate" name="appdate"
                                                    required="required">
                                                    <option value="" disabled selected>Select Date</option>
                                                </select>
                                            </div><br><br>
                                            

                                            <div class="col-md-4">
                                                <input type="submit" name="app-submit" value="Create new entry"
                                                    class="btn btn-primary" id="inputbtn">
                                            </div>
                                            <div class="col-md-8"></div>

                                            <script>
    function getUniqueSpecsFromCity(city, doctb) {
        let uniqueSpecs = [];

        for (let doctorId in doctb) {
            if (doctb.hasOwnProperty(doctorId) && doctb[doctorId].city === city) {
                let spec = doctb[doctorId].spec;

                // Check if the spec is not already in the array
                if (!uniqueSpecs.includes(spec)) {
                    uniqueSpecs.push(spec);
                }
            }
        }

        return uniqueSpecs;
    }

    function getUniqueCities(doctorTable) {
        // Create an array to store unique cities
        let uniqueCities = [];

        // Iterate through each doctor entry in the doctorTable
        for (const doctorId in doctorTable) {
            if (doctorTable.hasOwnProperty(doctorId)) {
                const doctor = doctorTable[doctorId];
                const city = doctor.city;

                // Check if the city is not already in the uniqueCities array
                if (!uniqueCities.includes(city)) {
                    uniqueCities.push(city);
                }
            }
        }

        return uniqueCities;
    }

    var doctb = <?php echo $doctb; ?>;
    console.log(doctb);
    var availabilitytb = <?php echo $availabilitytb; ?>;
    console.log(availabilitytb);
    // on change spec
    document.getElementById('spec').onchange = function () {
        // update doctors
        let docs;
        let spec = this.value;
        docs = [...document.getElementById('doctor').options];

        docs.forEach((el, ind, arr) => {
            arr[ind].setAttribute("style", "");
            if (el.getAttribute("data-spec") != spec) {
                arr[ind].setAttribute("style", "display: none");
            } else {
                arr[ind].setAttribute("style", "display: block");
            }
        });

        // update city
        docs = [...document.getElementById('city').options];
        AllowedCities = getUniqueCities(doctb);

        docs.forEach((el, ind, arr) => {
            arr[ind].setAttribute("style", "");
            if (!AllowedCities.includes(el.value)) {
                arr[ind].setAttribute("style", "display: none");
            } else {
                arr[ind].setAttribute("style", "display: block");
            }
        });

    };

    // on change city
    document.getElementById('city').onchange = function () {
        // update doctor
        let city = this.value;
        docs = [...document.getElementById('doctor').options];

        docs.forEach((el, ind, arr) => {
            arr[ind].setAttribute("style", "");
            if (el.getAttribute("data-city") != city) {
                arr[ind].setAttribute("style", "display: none");
            }
        });

        // update spec
        docs = [...document.getElementById('spec').options];
        AllowedSpecialities = getUniqueSpecsFromCity(city, doctb)
        docs.forEach((el, ind, arr) => {
            arr[ind].setAttribute("style", "");
            if (!AllowedSpecialities.includes(el.value)) {
                arr[ind].setAttribute("style", "display: none");
            } else {
                arr[ind].setAttribute("style", "display: block");
            }
        });

    };

    document.getElementById('doctor').onchange = function () {
        // update fees
        var selection = document.querySelector(`[value=${this.value}]`).getAttribute('data-value');
        document.getElementById('docFees').value = selection;

        // update available dates
        var id = document.querySelector(`[value=${this.value}]`).getAttribute('docID');
        var dateInput = document.getElementById('appdate');

        var availableDates = availabilitytb
            .filter(function (item) {
                return item.doctor_id === id;
            })
            .map(function (item) {
                return item.date;
            });

        dateInput.innerHTML = '';

        dateInput.setAttribute('disabled', 'disabled');

        var defaultOption = document.createElement('option');
        defaultOption.value = '';
        defaultOption.text = 'Select Date';
        dateInput.add(defaultOption);

        availableDates.forEach(function (date) {
            var option = document.createElement('option');
            option.value = date;
            option.text = date;
            dateInput.add(option);
        });

        if (availableDates.length > 0) {
            dateInput.removeAttribute('disabled');
        }

        var spec = document.querySelector(`[value=${this.value}]`).getAttribute('data-spec');
        var city = document.querySelector(`[value=${this.value}]`).getAttribute('data-city');

        var spec_selector = document.getElementById("spec");
        var city_selector = document.getElementById("city");

        var spec_choice = Array.from(spec_selector.options).find(option => option.value === spec);
        if (spec_choice) {
            spec_choice.selected = true;
        }
        var city_choice = Array.form(city_selector.options).find(option => option.value === city);
        if (city_choice) {
            city_choice.selected = true;
        }
    };

    // Initial call to set available dates when the page loads
    document.getElementById('doctor').dispatchEvent(new Event('change'));
</script>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div><br>
                    </div>

                    <div class="tab-pane fade" id="app-hist" role="tabpanel" aria-labelledby="list-pat-list">

                        <table class="table table-hover">
                            <thead>
                                <tr>

                                    <th scope="col">Doctor Name</th>
                                    <th scope="col">Consultancy Fees</th>
                                    <th scope="col">Appointment Date</th>
                                    <th scope="col">Current Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 

                    include('include/config.php');
                    global $con;

                    $query = "select ID,doctor,docFees,appdate,userStatus,doctorStatus from appointmenttb where fname ='$fname' and lname='$lname';";
                    $result = mysqli_query($con,$query);
                    while ($row = mysqli_fetch_array($result)){
              
                      #$fname = $row['fname'];
                      #$lname = $row['lname'];
                      #$email = $row['email'];
                      #$contact = $row['contact'];
                  ?>
                                <tr>
                                    <td><?php echo $row['doctor'];?></td>
                                    <td><?php echo $row['docFees'];?></td>
                                    <td><?php echo $row['appdate'];?></td>

                                    <td>
                                        <?php if(($row['userStatus']==1) && ($row['doctorStatus']==1))  
                    {
                      echo "Active";
                    }
                    if(($row['userStatus']==0) && ($row['doctorStatus']==1))  
                    {
                      echo "Cancelled by You";
                    }

                    if(($row['userStatus']==1) && ($row['doctorStatus']==0))  
                    {
                      echo "Cancelled by Doctor";
                    }
                        ?></td>

                                    <td>
                                        <?php if(($row['userStatus']==1) && ($row['doctorStatus']==1))  
                        { ?>


                                        <a href="admin-panel.php?ID=<?php echo $row['ID']?>&cancel=update"
                                            onClick="return confirm('Are you sure you want to cancel this appointment ?')"
                                            title="Cancel Appointment" tooltip-placement="top" tooltip="Remove"><button
                                                class="btn btn-danger">Cancel</button></a>
                                        <?php } else {

                                echo "Cancelled";
                                } ?>

                                    </td>
                                </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                        <br>
                    </div>



                    <div class="tab-pane fade" id="list-pres" role="tabpanel" aria-labelledby="list-pres-list">

                        <table class="table table-hover">
                            <thead>
                                <tr>

                                    <th scope="col">Doctor Name</th>
                                    <th scope="col">Appointment ID</th>
                                    <th scope="col">Appointment Date</th>
                                    <th scope="col">Diseases</th>
                                    <th scope="col">Allergies</th>
                                    <th scope="col">Prescriptions</th>
                                    <th scope="col">Bill Payment</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php 

                    include('include/config.php');
                    global $con;

                    $query = "select doctor,ID,appdate,disease,allergy,prescription from prestb where pid='$pid';";
                    
                    $result = mysqli_query($con,$query);
                    if(!$result){
                      echo mysqli_error($con);
                    }
                    

                    while ($row = mysqli_fetch_array($result)){
                  ?>
                                <tr>
                                    <td><?php echo $row['doctor'];?></td>
                                    <td><?php echo $row['ID'];?></td>
                                    <td><?php echo $row['appdate'];?></td>
                                    <td><?php echo $row['disease'];?></td>
                                    <td><?php echo $row['allergy'];?></td>
                                    <td><?php echo $row['prescription'];?></td>
                                    <td>
                                        <form method="get">
                                            <!-- <a href="admin-panel.php?ID=" 
                              onClick=""
                              title="Pay Bill" tooltip-placement="top" tooltip="Remove"><button class="btn btn-success">Pay</button>
                              </a></td> -->

                                            <a href="admin-panel.php?ID=<?php echo $row['ID']?>">
                                                <input type="hidden" name="ID" value="<?php echo $row['ID']?>" />
                                                <input type="submit" onclick="alert('Bill Paid Successfully');"
                                                    name="generate_bill" class="btn btn-success" value="Pay Bill" />
                                            </a>
                                    </td>
                                    </form>


                                </tr>
                                <?php }
                    ?>
                            </tbody>
                        </table>
                        <br>
                    </div>




                    <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
                        ...</div>
                    <div class="tab-pane fade" id="list-settings" role="tabpanel" aria-labelledby="list-settings-list">
                        <form class="form-group" method="post" action="func.php">
                            <label>Doctors name: </label>
                            <input type="text" name="name" placeholder="Enter doctors name" class="form-control">
                            <br>
                            <input type="submit" name="doc_sub" value="Add Doctor" class="btn btn-primary">
                        </form>
                    </div>
                    <div class="tab-pane fade" id="list-attend" role="tabpanel" aria-labelledby="list-attend-list">...
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.1/sweetalert2.all.min.js">
    </script>



</body>

</html>