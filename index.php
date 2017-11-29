<?php
    require_once('database.php');
    
    //Assignment 1 Part 2 ------ 28 November 2017
    
    //Set search term or hard-code the parameter value
    //$instructorID = "1990";
   // $query = "SELECT firstName, lastName FROM instructors WHERE instructorID = ?";
    $query = "SELECT firstName, lastName FROM instructors";
    $stmt =  $conn->prepare($query); //strips query of bs 
    
    //$stmt->bind_param('s', $instructorID);
    $stmt->execute();
    
    $stmt->store_result();
    
    //store result fields in variables
    $stmt->bind_result($firstName, $lastName);
    $instructors = $stmt; 
   // $instructors = $conn->query($query);
   //include('header.php');
  // session_start(); This is in the header.php file
?>

<p><?php include 'header.php'; ?></p>

<!-- BEGIN the body section -->
<body>
        <div id="page">

<!-- BEGIN the header section -->
<div id="header">
    <img src="header.jpg" alt="Search for classes" style="width:350px;height:69px;">
</div>
<!-- END the header section -->

<!-- BEGIN main section -->
<div id="main">
    
    <div id="content">
        <h1>Semester Drop Down</h1>
        
        <!-- fall17=1, spring18=2, summer18=3 --> 
        <form action="semesterresults.php" method="post">
            <select name="semester" id="semester">
                <option value="">Please select..</option>
                <option value="1">Fall 2017</option>
                <option value="2">Spring 2018</option>
                <option value="3">Summer 2018</option>
            </select>
            <input type="submit" name="semsubmit" id="submit"></input>
        </form>
    </div>
    
        
    <div id="content">
        <h1>Instructors</h1>
        <!-- display a table of instructors-->
        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
            </tr>
            <?php while ($stmt->fetch()) { ?>
            <tr>
                <td><?php echo $firstName ?></td>
                <td><?php echo $lastName ?></td>
            </tr>
            <?php } 
             $stmt->free_result();
             $conn->close();
             ?>
        </table>
    </div>
    
</div>
<!-- END main section -->

<!-- shared footer information comes from include file -->
<p><?php include 'footer.php'; ?></p>