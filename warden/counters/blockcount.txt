<?php
    include '../includes/dbconn.php';

    $sql = "SELECT id FROM block";
                $query = $mysqli->query($sql);
                echo "$query->num_rows";
?>