<?php
// session_start();
include('./include/config.php');
// if(isset($_POST['submit'])){
//  $username=$_POST['username'];
//  $password=$_POST['password'];
//  $query="select * from logintb where username='$username' and password='$password';";
//  $result=mysqli_query($con,$query);
//  if(mysqli_num_rows($result)==1)
//  {
//   $_SESSION['username']=$username;
//   $_SESSION['pid']=
//   header("Location:admin-panel.php");
//  }
//  else
//   header("Location:error.php");
// }
if(isset($_POST['update_data']))
{
 $contact=$_POST['contact'];
 $status=$_POST['status'];
 $query="update appointmenttb set payment='$status' where contact='$contact';";
 $result=mysqli_query($con,$query);
 if($result)
  header("Location:updated.php");
}

function display_specs($tb) {
  // Check if there are results
  if (!empty($tb)) {
      // Create an array to store unique specialties
      $uniqueSpecialties = array();

      foreach ($tb as $row) {
          $spec = $row['spec'];

          // Check if the specialty is not already in the uniqueSpecialties array
          if (!in_array($spec, $uniqueSpecialties)) {
              $uniqueSpecialties[] = $spec;
              echo '<option data-value="' . $spec . '">' . $spec . '</option>';
          }
      }
  } else {
      echo '<option value="" disabled>No specialties available</option>';
  }
}


function display_docs($tb) {
  if (!empty($tb)) {
    foreach ($tb as $row) {
      $id = $row['id'];
      $username = $row['username'];
      $price = $row['docFees'];
      $spec = $row['spec'];
      $city = $row['city'];
      echo "<option value=\"$username\" data-value=\"$price\" data-spec=\"$spec\" data-city=\"$city\" docID=\"$id\">$username</option>";
    }
  } else {
    echo '<option value="" disabled>No doctors available</option>';
  }
}

function display_cities($tb) {
  // Check if there are results
  if (!empty($tb)) {
      // Create an array to store unique cities
      $uniqueCities = array();

      foreach ($tb as $row) {
          $city = $row['city'];

          // Check if the city is not already in the uniqueCities array
          if (!in_array($city, $uniqueCities)) {
              $uniqueCities[] = $city;
              echo '<option value="'. $city .'" >' . $city . '</option>';
          }
      }
  } else {
      echo '<option value="" disabled>No doctors in any City available</option>';
  }
}




if(isset($_POST['doc_sub']))
{
 $username=$_POST['username'];
 $query="insert into doctb(username)values('$username')";
 $result=mysqli_query($con,$query);
 if($result)
  header("Location:adddoc.php");
}

?>