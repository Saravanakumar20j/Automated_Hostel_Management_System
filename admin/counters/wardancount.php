<?php
    include '../includes/dbconn.php';

    $sql = "SELECT id FROM warden";
                $query = $mysqli->query($sql);
                echo "$query->num_rows";
?>