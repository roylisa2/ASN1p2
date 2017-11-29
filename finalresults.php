<?php
    require_once('database.php');
    include 'header.php';
    
    //Assignment 1 Part 2 ------ 28 November 2017
    
    //Set search term or hard-code the parameter value
    //$instructorID = "1990";
    $_SESSION['subject'] = $_POST['subject'];

    //$_SESSION['semester'] = $semesterid ;
    //$_SESSION['subject'] = $subjectid;
    
    $semesterid = $_SESSION['semester'] ;
    $subjectid = $_SESSION['subject'];
    
    //echo "vars";
    //var_dump($semesterid);
    //var_dump($subjectid);

    // $query = "SELECT firstName, lastName FROM instructors WHERE instructorID = ?";
    //$query = "SELECT firstName, lastName FROM instructors";
    
    $query = "SELECT classname, days_offered, location, lastname,
              firstname, credithours, time, crn, classdesc
              FROM class, section, instructors 
              WHERE subjectid = ? 
              AND class.classid = section.classid 
              AND section.instructorid = instructors.instructorid 
              AND section.semesterid = ?";
    
    /*
    $query = "SELECT classname, days_offered, location, lastname 
              FROM class, section, instructors 
              WHERE subjectid = " + $subjectid + 
              "AND class.classid = section.classid 
              AND section.instructorid = instructors.instructorid 
              AND section.semesterid = " + $semesterid;
    */
    $stmt =  $conn->prepare($query);//strips query of bs 
    
    $stmt->bind_param('ss', $subjectid, $semesterid);

    $stmt->execute();
    //var_dump($stmt);
    $stmt->store_result();
    
    //store result fields in variables
    $stmt->bind_result($classname, $days_offered, $location, $lastname, $firstname, $credithours, $time, $crn, $classdesc);
    //$instructors = $stmt; 
    // $instructors = $conn->query($query);
?>

<p></p>

<!-- BEGIN the body section -->
<body>
        <div id="page">

<!-- BEGIN the header section -->
<div id="header">
    <img src="header.jpg" alt="Search for classes" style="width:350px;height:69px;">
    <br>
    <a href="index.php">Go Back</a>
</div>
<!-- END the header section -->

<!-- BEGIN main section -->
<div id="main">
    <h1>Results</h1>

    <div id="content">
        <!-- display query results-->
        <table>
            <tr>
                <th>Class Name</th>
                <th>Description</th>
                <th>Credit Hours</th> 
                <th>CRN</th>
                <th>Offered</th>
                <th>Time</th>
                <th>Location</th> 
                <th>First Name</th>
                <th>Last Name</th>
            </tr>
            <?php while ($stmt->fetch()) { ?>
            <tr>
                <td><?php echo $classname ?></td>
                <td><?php echo $classdesc ?></td>
                <td><?php echo $credithours ?></td>
                <td><?php echo $crn ?></td>
                <td><?php echo $days_offered ?></td>
                <td><?php echo $time ?></td>
                <td><?php echo $location ?></td>
                <td><?php echo $firstname ?></td>
                <td><?php echo $lastname ?></td>
            </tr>
                <?php } 
                 $stmt->free_result();
                 $stmt->close();
                 $conn->close(); 
                 ?>
        </table>
    </div>
    
     <!-- shared testing information comes from include file -->
    <?php 
    //include 'testingstuff.php'; 
    ?>         
    
</div>
<!-- END main section -->

 <!-- shared footer information comes from include file -->
    <p><?php include 'footer.php'; ?></p>