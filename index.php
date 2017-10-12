<?php
    require_once('database.php');

    // Get customers for selected category
    $query = "SELECT firstName, lastName FROM customers order by lastName";
    // Results set
    $customers = $conn->query($query);
?>

<!-- header information comes from include file -->
    <p><?php include 'header.php'; ?></p>


    <select name="list-select" id="list-select">
     <option value="">Please select..</option>
     <option value="tea">tea</option>
     <option value="coffee">coffee</option>
     <option value="water">water</option>
</select>
 
<select name="list-target" id="list-target"></select>


    <div id="header">
        <h1>Customer Manager</h1>
    </div>

    <div id="main">

        <h1>Customers</h1>


        <div id="content">
            <!-- display a table of customers -->
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                </tr>
                <?php foreach ($customers as $customer) : ?>
                <tr>
                    <td><?php echo $customer['firstName']; ?></td>
                    <td><?php echo $customer['lastName']; ?></td>
                </tr>
                <?php endforeach; ?>
            </table>
        </div>
    </div>

 <!-- shared footer information comes from include file -->
    <p><?php include 'footer.php'; ?></p>