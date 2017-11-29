    <?php 
    //$_SESSION['subject'] = $_POST['subject'];
    //var_dump($_SESSION);
    ?>
        
    <div id="content">
        <h2>Session Variables</h2>
        <h3>Testing purposes...</h3>
        <ul>
            <li>Page 1: <?php echo $_SESSION['semester'] ?></li>
            <li>Page 2: <?php echo $_SESSION['subject'] ?></li>
            <li>Page 1: <?php echo $semesterid ?></li>
            <li>Page 2: <?php echo $subjectid ?></li>
        </ul>
        
    </div>