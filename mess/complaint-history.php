<?php
    session_start();
    include('../includes/dbconn.php');
    include('../includes/check-login.php');
    check_login();
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
                
                <div class="col-7 align-self-center">
                        <h4 class="page-title text-truncate text-dark font-weight-medium mb-1">Details About My Booked Room</h4>
                </div>



                <!--Table Column -->
                
                 <section id="main-content">
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> Complaint Details</h3>
            <hr />

 ===========================================
                    <?php	
                                        $aid=$_SESSION['id'];
                                        $ret="SELECT * from tblcomplaints where blockid = '$_SESSION[id]'";
                                        $stmt= $mysqli->prepare($ret) ;
                                        $stmt->execute() ;//ok
                                        $res=$stmt->get_result();
                                        $cnt=1;
                                        while($row=$res->fetch_object())
                                            {
                                                ?>
 
          	<div class="row mt">
            <label class="col-sm-2 col-sm-2 control-label"><b>Complaint Number : </b></label>
          		<div class="col-sm-4">
          		<p><?php echo htmlentities($row['complaintNumber']);?></p>
          		</div>
<label class="col-sm-2 col-sm-2 control-label"><b>Reg. Date :</b></label>
              <div class="col-sm-4">
              <p><?php echo htmlentities($row['regDate']);?></p>
              </div>
          	</div>






  <div class="row mt">
            <label class="col-sm-2 col-sm-2 control-label"><b>Complaint Type :</b></label>
              <div class="col-sm-4">
              <p><?php echo htmlentities($row['complaintType']);?></p>
              </div>
<label class="col-sm-2 col-sm-2 control-label"><b>State :</b></label>
              <div class="col-sm-4">
              <p><?php echo htmlentities($row['state']);?></p>
              </div>
            </div>  



  <div class="row mt">
            <label class="col-sm-2 col-sm-2 control-label"><b>Nature of Complaint :</b></label>
              <div class="col-sm-4">
              <p><?php echo htmlentities($row['noc']);?></p>
              </div>
<label class="col-sm-2 col-sm-2 control-label"><b>File :</b></label>
              <div class="col-sm-4">
              <p><?php $cfile=$row['complaintFile'];
if($cfile=="" || $cfile=="NULL")
{
  echo htmlentities("File NA");
}
else{ ?>
<a href="complaintdocs/<?php echo htmlentities($row['complaintFile']);?>"> View File</a>
<?php } ?>

              </p>
              </div>
            </div> 
 <div class="row mt">
            <label class="col-sm-2 col-sm-2 control-label"><b>Complaint Details </label>
              <div class="col-sm-10">
              <p><?php echo htmlentities($row['complaintDetails']);?></p>
              </div>

            </div> 



 <div class="row mt">
            
<label class="col-sm-2 col-sm-2 control-label"><b>Remark:</b></label>
              <div class="col-sm-10">
   <?php echo  htmlentities($rw['remark']); ?>&nbsp;&nbsp; <b>Remark Date: <?php echo  htmlentities($rw['rdate']); ?></b>
              </div>
            </div> 
 <div class="row mt">
            
<label class="col-sm-2 col-sm-2 control-label"><b>Status:</b></label>
              <div class="col-sm-10">
 <?php echo  htmlentities($rw['sstatus']); ?>
              </div>
            </div>

<?php  ?>

 <div class="row mt">
            
<label class="col-sm-2 col-sm-2 control-label"><b>Final Status :</b></label>
              <div class="col-sm-4">
              <p style="color:red"><?php 

if($row['status']=="NULL" || $row['status']=="" )
{
echo "Not Process yet";
} else{
              echo htmlentities($row['status']);
}
              ?></p>
              </div>
            </div> 
            




<?php  ?>
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
<?php include('includes/footer.php');?>
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="assets/js/jquery.ui.touch-punch.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>