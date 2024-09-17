<?php
    include '../includes/dbconn.php';

    $sql = "SELECT registration.blockid
    FROM warden
    INNER JOIN registration ON registration.blockid = warden.blockid
    Where warden.blockid = '$_SESSION[id]'";
                $query = $mysqli->query($sql);
                echo "$query->num_rows";
?>