<?php
include('./include/config.php');
session_start();

echo $_SESSION['pid'];
echo $_SESSION['username'];
echo $_SESSION['email'];
echo $_SESSION['fname'];
echo $_SESSION['gender'];
echo $_SESSION['lname'];
echo $_SESSION['contact'];

$columns = [];
$table = $_GET['table'];
$id = $_GET['id'];
$page = $_GET['page'];
global $row;
if (isset($_GET['table']) && isset($_GET['id']) && isset($_GET['page'])) {
    
    // Fetch data from the database
    if ($table == "patreg") {
        $query = "SELECT * FROM $table WHERE pid = '$id'";
    }else {
        $query = "SELECT * FROM $table WHERE id = '$id'";
    }

    $result = mysqli_query($con, $query);

    if ($result) {
        $row = mysqli_fetch_assoc($result);
        $columns = array_keys($row);
    } else {
        echo "Error: " . mysqli_error($con);
        exit();
    }
} else {
    echo "Invalid parameters.";
    exit();
}


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Handle form submission and update database
    $updateQuery = "UPDATE $table SET ";

    // Build the SET part of the query dynamically
    for ($i = 0; $i < count($columns); $i++) {
        if ($columns[$i] != 'id'){
            $updateQuery .= "$columns[$i] = '" . $_POST[$columns[$i]] . "', ";
        }
    }

    // Remove the trailing comma and space
    $updateQuery = rtrim($updateQuery, ', ');

    if ($table == "patreg") {
        $updateQuery .= " WHERE pid = '$pid'";
    }else {
        $updateQuery .= " WHERE id = '$id'";
    }

    $updateResult = mysqli_query($con, $updateQuery);

    if ($updateResult) {
        echo "<script>alert('Data updated successfully');</script>";
        echo "<a href='$page'>Go Back to Page</a>";
        echo "<script>window.location.href='$page'";
    } else {
        echo "<script>alert('Error updating data: " . mysqli_error($con) . "');</script>";
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="style.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
        integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <title>Account Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 70px; /* Adjusted margin-top */
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
        <a class="navbar-brand" href="<?php echo $page; ?>"><i class="fa fa-user-plus" aria-hidden="true"></i> CARE GROUP </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="logout.php"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"></a>
                </li>
            </ul>
        </div>
    </nav>

    <div>
        <h2>Account Details</h2>
        <form method="post" action="<?php echo $_SERVER['REQUEST_URI']; ?>">
            <?php
            global $row;
            foreach ($row as $key => $value) {
                // Exclude 'id' field and make other fields readonly
                if ($key !== 'id') {
                    echo "<label for='$key'>$key:</label>";
                    echo "<input type='text' name='$key' id='$key' value='$value' readonly>";
                }
            }
            ?>
            <button type="button" id="editButton" onclick="enableEdit()">Edit</button>
            <button type="submit" id="submitButton" style="display: none;">Submit</button>
        </form>
    </div>

    <script>
        function enableEdit() {
            var inputs = document.getElementsByTagName('input');
            for (var i = 0; i < inputs.length; i++) {
                inputs[i].readOnly = false;
            }

            document.getElementById('editButton').style.display = 'none';
            document.getElementById('submitButton').style.display = 'block';
        }
    </script>
</body>
</html>
