<?php
    include '../includes/dbconn.php';

    $sql = "SELECT rooms.blockid
    FROM warden
    INNER JOIN rooms ON rooms.blockid = warden.blockid
    Where warden.blockid = '$_SESSION[id]'";
                $query = $mysqli->query($sql);
                echo "$query->num_rows";
?>