<?php
    session_start();
    include('../includes/dbconn.php');
    if(isset($_POST['submit']))
    {
   
    $sessionname=$_POST['sessionname'];
	$termName=$_POST['termName'];
	$termid=$_POST['termid'];
	$dateCreated = date("Y-m-d");
    $query="INSERT into sessionterm(sessionname,termName,termid,dateCreated) values(?,?,?,?)";
    $stmt = $mysqli->prepare($query);
    $rc=$stmt->bind_param('ssis',$sessionname,$termName,$termid,$dateCreated);
    $stmt->execute();
        echo"<script>alert('Session has been Registered!');</script>";
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
    }
	
	
	
	
	
	//--------------------EDIT------------------------------------------------------------

 if (isset($_GET['id']) && isset($_GET['action']) && $_GET['action'] == "edit")
	{
        $id= $_GET['id'];

        $query=mysqli_query($mysqli,"select * from sessionterm where id ='$id'");
        $row=mysqli_fetch_array($query);

        //------------UPDATE-----------------------------

        if(isset($_POST['update'])){
    
             $sessionName=$_POST['sessionName'];
    $termid=$_POST['termid'];
    $dateCreated = date("Y-m-d");
        
            $query=mysqli_query($mysqli,"update sessionterm set sessionname='$sessionname',termid='$termid',isActive='0' where id='$id'");

            if ($query) {
                
                echo "<script type = \"text/javascript\">
                window.location = (\"createSessionTerm.php\")
                </script>"; 
            }
            else
            {
                $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>An error Occurred!</div>";
            }
        }
    }


//--------------------------------DELETE------------------------------------------------------------------

  if (isset($_GET['id']) && isset($_GET['action']) && $_GET['action'] == "delete")
	{
        $id= $_GET['id'];
        $query = mysqli_query($mysqli,"DELETE FROM sessionterm WHERE id='$id'");

        if ($query == TRUE) {

                echo "<script type = \"text/javascript\">
                window.location = (\"createSessionTerm.php\")
                </script>";  
        }
        else{

            $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>An error Occurred!</div>"; 
         }
      
  }


  //--------------------------------ACTIVATE------------------------------------------------------------------

  if (isset($_GET['id']) && isset($_GET['action']) && $_GET['action'] == "activate")
	{
        $id= $_GET['id'];

        $query=mysqli_query($mysqli,"update sessionterm set isActive='0' where isActive='1'");

            if ($query) {
                
                $que=mysqli_query($mysqli,"update sessionterm set isActive='1' where id='$id'");

                if ($que) {
                    
                    echo "<script type = \"text/javascript\">
                    window.location = (\"createSessionTerm.php\")
                    </script>";  
                }
                else
                {
                    $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>An error Occurred!</div>";
                }
            }
            else
            {
                $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>An error Occurred!</div>";
            }
      
  }
	
	
	
?>

<!DOCTYPE html>
<html dir="ltr" lang="en">

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

    <script type="text/javascript">
    function valid(){
        if(document.registration.password.value!= document.registration.cpassword.value)
    {
        alert("Password and Confirm Password does not match");
        document.registration.cpassword.focus();
        return false;
    }
        return true;
    }
    </script>
    
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
            <?php include 'includes/navigation.php'?>
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
                <?php include 'includes/sidebar.php'?>
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
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="page-breadcrumb">
                <div class="row">
                    <div class="col-7 align-self-center">
                    <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Create Session and Term</h4>
                        <div class="d-flex align-items-center">
                            <!-- <nav aria-label="breadcrumb">
                                
                            </nav> -->
                        </div>
                    </div>
                    
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">

                <form method="POST" name="registration" onSubmit="return valid();">

                    <div class="row">



                      



                        <div class="col-sm-12 col-md-6 col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Session Name</h4>
                                        <div class="form-group">
                                            <input type="text" name="sessionname" id="sessionname" placeholder="Enter Session Name" required class="form-control">
                                        </div>
                                </div>
                            </div>
                        </div>


                        


                       
						
						<div class="col-sm-12 col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Term</h4>
                                    <div class="form-group mb-4">
                                        <select class="custom-select mr-sm-2" id="termName" name="termName">
                                            <option selected>Please Select...</option>
                                            <?php $query ="SELECT * FROM term";
                                                $stmt2 = $mysqli->prepare($query);
                                                $stmt2->execute();
                                                $res=$stmt2->get_result();
												
                                                while($row=$res->fetch_object())
                                                {
                                            ?>
                                            <option value="<?php echo $row->termName;?>" ><?php echo $row->termName;?>&nbsp;&nbsp;</option>
											
                                            <?php } ?>
                                        </select>
                                    </div>
                              
                            </div>
                        </div>
                    </div>
					
					
					
					
					
					
					<div class="col-sm-12 col-md-6 col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Conform Term</h4>
                                    <div class="form-group mb-4">
                                        <select class="custom-select mr-sm-2" id="termid" name="termid">
                                            <option selected>Please Select...</option>
                                            <?php $query ="SELECT * FROM term";
                                                $stmt2 = $mysqli->prepare($query);
                                                $stmt2->execute();
                                                $res=$stmt2->get_result();
												
                                                while($row=$res->fetch_object())
                                                {
                                            ?>
                                            <option value="<?php echo $row->id;?>" ><?php echo $row->termName;?>&nbsp;&nbsp;</option>
											
                                            <?php } ?>
                                        </select>
                                    </div>
                              
                            </div>
                        </div>
                    </div>


                        
                

                    <div class="form-actions">
                        <div class="text-center">
                            <button type="submit" name="submit" class="btn btn-success">Register</button>
                            <button type="reset" class="btn btn-danger">Reset</button>
                        </div>
                    </div>
                
                </form>


            </div>
			
			 <div class="row">
			  <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">All Session and Term</h6>
                  <h6 class="m-0 font-weight-bold text-danger">Note: <i>Click on the check symbol besides each to make session and term active!</i></h6>
                </div>
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                    <thead class="thead-light">
                      <tr>
                        <th>#</th>
                        <th>Session</th>
                        <th>Term</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Activate</th>
                        <th>Edit</th>
                        <th>Delete</th>
                      </tr>
                    </thead>
                  
                    <tbody>
					 
					 <?php	
                                        $aid=$_SESSION['id'];
                                        $ret="SELECT * from sessionterm";
                                        $stmt= $mysqli->prepare($ret) ;
                                        $stmt->execute() ;//ok
                                        $res=$stmt->get_result();
                                        $cnt=1;
                                        
										  $sn=0;
										  if(1 > 0)
										  { 
											while ($rows = $res->fetch_assoc())
											  {
												if($rows['isActive'] == '1'){$status = "Active";}else{$status = "InActive";}
												 $sn = $sn + 1;
												echo"
												  <tr>
													<td>".$sn."</td>
													<td>".$rows['sessionname']."</td>
													<td>".$rows['termName']."</td>
													<td>".$status."</td>
													<td>".$rows['dateCreated']."</td>
													 <td><a href='?action=activate&id=".$rows['id']."'><i class='fas fa-fw fa-check'></i></a></td>
													<td><a href='?action=edit&id=".$rows['id']."'><i class='fas fa-fw fa-edit'></i></a></td>
													<td><a href='?action=delete&id=".$rows['id']."'><i class='fas fa-fw fa-trash'></i></a></td>
												  </tr>";
											  }
										  }  ?>
					 
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					</tbody>
                  </table>
                </div>
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

    <!-- customs -->
    <script>
    function checkAvailability() {

        $("#loaderIcon").show();
        jQuery.ajax({
        url: "check-availability.php",
        data:'emailid='+$("#email").val(),
        type: "POST",
        success:function(data){
            $("#user-availability-status").html(data);
            $("#loaderIcon").hide();
            },
                error:function ()
            {
                event.preventDefault();
                alert('error');
            }
        });
    }
    </script>
</body>

</html>