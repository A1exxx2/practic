<?php
session_start();
require_once('php/db.php');

if(isset($_SESSION['login_user'])){
    $user_check = $_SESSION['login_user'];
    $query = mysqli_query($conn, "SELECT * FROM users WHERE email = '$user_check' ");
    $row = mysqli_fetch_array($query);
    $email = $row['email'];   


    //  2
    $query2 = "SELECT *
    FROM jewelry_pieces
    WHERE cost > 1000";
    $result2 = mysqli_query($conn, $query2);

    //  3
    $query3 = "SELECT *
    FROM orders
    WHERE client_id = 5";
    $result3 = mysqli_query($conn, $query3);


    //  5
    $query5 = "SELECT jewelry_pieces.name, COUNT(*) as total_orders
    FROM jewelry_pieces
    GROUP BY jewelry_pieces.name";
    $result5 = mysqli_query($conn, $query5);

    //  6
    $query6 = "SELECT clients.name, SUM(orders.order_cost) as total_spent
    FROM clients
    INNER JOIN orders ON clients.id = orders.client_id
    GROUP BY clients.name
    HAVING SUM(orders.order_cost) > 10000";
    $result6 = mysqli_query($conn, $query6);

    //  7
    $query7 = "SELECT *
    FROM jewelry_pieces, orders
    WHERE EXTRACT(YEAR FROM orders.date_created) > 2020";
    $result7 = mysqli_query($conn, $query7);

    //  8
    $query8 = "SELECT *
    FROM orders
    WHERE date_completed BETWEEN '2020-01-01' AND '2022-12-30'";
    $result8 = mysqli_query($conn, $query8);

    //  9
    $query9 = "SELECT jewelry_pieces.metal, COUNT(*) as total_items
    FROM jewelry_pieces
    GROUP BY jewelry_pieces.metal";
    $result9 = mysqli_query($conn, $query9);

}
?>
<p>Ваша почта: <?=$email;?></p>


<!-- второе задание  -->
<h2>2. Получить список всех изделий, у которых стоимость превышает заданную сумму. (> 500)</h2>

    <?php  while($row2 = mysqli_fetch_array($result2)){
        $name = $row2['name'];
    
        echo "<p>".$name."</p>";
    }?>



<!-- третье задание  -->
<h2>3. Получить список всех заказов определенного клиента.</h2>

    <?php  while($row3 = mysqli_fetch_array($result3)){
        $description = $row3['description'];
        $material = $row3['material'];
    
        echo "<p>".$material." - ".$description."</p>";
    }?>

    <!-- пятое задание  -->
<h2>5. Получить список всех заказов, сгруппированных по типу изделия и указанием общего количества заказов для каждого типа.</h2>

<?php  while($row5 = mysqli_fetch_array($result5)){
    $name = $row5['name'];
    $total_orders = $row5['total_orders'];

    echo "<p>".$name." - ".$total_orders."</p>";
}?>
 <!-- шестое задание  -->
<h2>6. Получить список всех клиентов, у которых сумма заказов превышает заданное значение. (>10 000)</h2>

<?php  while($row6 = mysqli_fetch_array($result6)){
    $name = $row6['name'];
    $total_spent = $row6['total_spent'];

    echo "<p>".$name." - ".$total_spent."</p>";
}?>
 <!-- седьмое задание  -->
 <h2>7. Получить список всех изделий, у которых год выпуска позднее заданного значения.</h2>

<?php  while($row7 = mysqli_fetch_array($result7)){
    $name = $row7['name'];
    echo "<p>".$name." </p>";
}?>

<h2>8. Получить список всех заказов, у которых дата выполнения попадает в заданный временной интервал.</h2>

<?php  while($row8 = mysqli_fetch_array($result8)){
    $description = $row8['description'];
    $material = $row8['material'];
    $order_cost = $row8['order_cost'];
    $date_created = $row8['date_created'];
    $date_due = $row8['date_due'];
    $date_completed = $row8['date_completed'];
    echo "<p>".$description." - ".$material." - ".$order_cost." - ".$date_created." - ".$date_due." - ".$date_completed."</p>";
}?>

<h2>9. Получить список всех изделий, сгруппированных по материалу и указанием количества изделий для каждого материала.</h2>

<?php  while($row9 = mysqli_fetch_array($result9)){
    $metal = $row9['metal'];
    $total_items = $row9['total_items'];
   
    echo "<p>".$metal." - ".$total_items." </p>";
}?>
