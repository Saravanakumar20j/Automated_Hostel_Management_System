<?php
    session_start();
    include('../includes/dbconn.php');
    include('../includes/check-login.php');
    check_login();
    if(isset($_POST['submit'])){
        
		$uid=$_SESSION['id'];
       
		$complaintype=$_POST['complaintype'];
		$blockid=$_POST['blockid'];
		$complaintdetials=$_POST['complaindetails'];
		$compfile=$_FILES["compfile"]["name"];
		
		move_uploaded_file($_FILES["compfile"]["tmp_name"],"complaintdocs/".$_FILES["compfile"]["name"]);
		
        $query="INSERT into tblcomplaints (userId,blockid,complaintType,complaintDetails,complaintFile) values(?,?,?,?,?)";
		$stmt = $mysqli->prepare($query);
        $rc=$stmt->bind_param('iisss',$uid,$blockid,$complaintype,$complaintdetials,$compfile);
        $stmt->execute();
       
		echo"<script>alert('Requested Student complaint Has Been Registered!');</script>";
    }
?>

<!DOCTYPE html>
<html dir="ltr" lang="en">
<!-- By CodeAstro - codeastro.com -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../assets/images/favicon.png">
    <title>Hostel Management System</title>
    <!-- Custom CSS -->
    <link href="../assets/extra-libs/c3/c3.min.css" rel="stylesheet">
    <link href="../assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../dist/css/style.min.css" rel="stylesheet">
	
	

    <script>
    function getSeater(val) {
        $.ajax({
        type: "POST",
        url: "get-seater.php",
        data:'roomid='+val,
        success: function(data){
        //alert(data);
        $('#seater').val(data);
        }
        });

        $.ajax({
        type: "POST",
        url: "get-seater.php",
        data:'rid='+val,
        success: function(data){
        //alert(data);
        $('#fpm').val(data);
        }
        });
    }
    </script>
    <!-- By CodeAstro - codeastro.com -->
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-theme="light" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed" data-boxed-layout="full">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <header class="topbar" data-navbarbg="skin6">
            <?php include '../includes/student-navigation.php'?>
        </header>
        <!-- ============================================================== -->
        <!-- End Topbar header -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <aside class="left-sidebar" data-sidebarbg="skin6">
            <!-- Sidebar scroll-->
            <div class="scroll-sidebar" data-sidebarbg="skin6">
                <?php include '../includes/student-sidebar.php'?>
            </div>
            <!-- End Sidebar scroll-->
        </aside>
        <!-- ============================================================== -->
        <!-- End Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page wrapper  -->
        <!-- ============================================================== -->
        <div class="page-wrapper">
            
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                
                <form method="POST">
                
                


                <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Complaint System</h4>
                    </div>

                
                <div class="row">


                


                    <div class="col-sm-12 col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Complaint Type</h4>
                                    <div class="form-group mb-4">
                                        <select class="custom-select mr-sm-2" id="complaintype" name="complaintype">
                                            <option selected>Choose...</option>
                                            <option value="Complaint">Complaint</option>
                                            <option value="General Query">General Query</option>
                                           
                                        </select>
                                    </div>
                              
                            </div>
                        </div>
                    </div>
					
						<div class="col-sm-12 col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Block</h4>
                                    <div class="form-group mb-4">
                                        <select class="custom-select mr-sm-2" id="blockid" name="blockid">
                                            <option selected>Please Select...</option>
                                            <?php $query ="SELECT * FROM block";
                                                $stmt2 = $mysqli->prepare($query);
                                                $stmt2->execute();
                                                $res=$stmt2->get_result();
												
                                                while($row=$res->fetch_object())
                                                {
                                            ?>
                                            <option value="<?php echo $row->id;?>" ><?php echo $row->block;?>&nbsp;&nbsp;</option>
											
                                            <?php } ?>
                                        </select>
                                    </div>
                              
                            </div>
                        </div>
                    </div>
						
						
						<div class="form-group">
                    <label class="col-sm-2 col-sm-2 control-label">Complaint Related Doc(if any) </label>
					<div class="col-sm-6">
					<input type="file" name="compfile" class="form-control" value="">
					</div>
					</div>
					
                    
					 
                   <div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">Complaint Details (max 2000 words) </label>
							<div class="col-sm-6">
							<textarea  name="complaindetails" required="required" cols="100" rows="10" class="form-control" maxlength="2000"></textarea>
						</div>
					</div>
					
					
					
					

                


                    <div class="form-actions">
                        <div class="text-center">
                            <button type="submit" name="submit" class="btn btn-success">Submit</button>
                            <button type="reset" class="btn btn-dark">Reset</button>
                        </div>
                    </div>

                
                </form>

            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <?php include '../includes/footer.php' ?>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="../assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="../assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- apps -->
    <!-- apps -->
    <script src="../dist/js/app-style-switcher.js"></script>
    <script src="../dist/js/feather.min.js"></script>
    <script src="../assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="../dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="../dist/js/custom.min.js"></script>
    <!--This page JavaScript -->
    <script src="../assets/extra-libs/c3/d3.min.js"></script>
    <script src="../assets/extra-libs/c3/c3.min.js"></script>
    <script src="../assets/libs/chartist/dist/chartist.min.js"></script>
    <script src="../assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="../dist/js/pages/dashboards/dashboard1.min.js"></script>


</body>

<!-- Custom Ft. Script Lines -->
<script type="text/javascript">
	$(document).ready(function(){
        $('input[type="checkbox"]').click(function(){
            if($(this).prop("checked") == true){
                $('#paddress').val( $('#address').val() );
                $('#pcity').val( $('#city').val() );
                $('#ppincode').val( $('#pincode').val() );
            } 
            
        });
    });
    </script>
    
    <script>
        function checkAvailability() {
        $("#loaderIcon").show();
        jQuery.ajax({
        url: "check-availability.php",
        data:'roomno='+$("#room").val(),
        type: "POST",
        success:function(data){
            $("#room-availability-status").html(data);
            $("#loaderIcon").hide();
        },
            error:function (){}
            });
        }
    </script>


    <script type="text/javascript">

    $(document).ready(function() {
        $('#duration').keyup(function(){
            var fetch_dbid = $(this).val();
            $.ajax({
            type:'POST',
            url :"ins-amt.php?action=userid",
            data :{userinfo:fetch_dbid},
            success:function(data){
            $('.result').val(data);
            }
            });
            

    })});
    </script>

</html>