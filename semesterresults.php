<?php
    require_once('database.php');
    //Assignment 1 Part 2 ------ 28 November 2017
?>

<!-- header information comes from include file -->
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
    
    <h1>Subject Drop Downs</h1>
    <div id="content">
        
        <!-- math=100, cpsc=200, earthsci=300, pe=400 --> 
        <form action="finalresults.php" method="post">
            <select name="subject" id="subject">
                <option value="">Please select..</option>
                <option value="100">Math</option>
                <option value="200">Computer Science</option>
                <option value="300">Earth Science</option>
                <option value="400">Physical Education</option>
            </select>
            <input type="submit" name="subsubmit" id="submit"></input>
        </form>
        
    <?php
    //session_start();
    if(isset($_POST['semester']))
    $_SESSION['semester'] = $_POST['semester'];
    
    //echo $_SESSION['semester'];
    //var_dump($_SESSION);
    ?>  
    </div>
    
</div>
<!-- END main section -->

<!-- shared footer information comes from include file -->
<p><?php include 'footer.php'; ?></p>