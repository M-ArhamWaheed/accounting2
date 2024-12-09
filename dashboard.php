<!doctype html>
<html lang="en">
<?php include_once 'includes/head.php';
$current_date = date('Y-m-d');
$d = strtotime("last Day");

$yesterday_date = date("Y-m-d", $d);
$previous_week = strtotime("-1 week +1 day");
$start_week = strtotime("last sunday midnight", $previous_week);
$end_week = strtotime("next saturday", $start_week);

$start_week = date("Y-m-d", $start_week);
$end_week = date("Y-m-d", $end_week);
$d = strtotime("today");
$last_start_week = strtotime("last sunday midnight", $d);
$last_end_week = strtotime("next saturday", $d);
$start = date("Y-m-d", $last_start_week);
$end = date("Y-m-d", $last_end_week);
$start_of_month = date('Y-m-01', strtotime(date('Y-m-d')));
// Last day of the month.
$end_of_month = date('Y-m-t', strtotime($current_date));
?>
<style>
    .table-card {
        height: 40vh;
        overflow-y: auto;
    }
</style>

<body class="horizontal light  ">
    <div class="wrapper">
        <?php include_once 'includes/header.php'; ?>
        <main role="main" class="main-content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-12">
                        <div class="row align-items-center mb-2">
                            <div class="col">
                                <h2 class="h5 page-title">Welcome!</h2>
                            </div>
                            <div class="col-auto">
                                <form class="form-inline">
                                    <div class="form-group d-none d-lg-inline">
                                        <label for="reportrange" class="sr-only">Date Ranges</label>
                                        <div id="reportrange" class="px-2 py-2 text-muted">
                                            <span class="small"></span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="button" class="btn btn-sm"><span class="fe fe-refresh-ccw fe-16 text-muted"></span></button>
                                        <button type="button" class="btn btn-sm mr-2"><span class="fe fe-filter fe-16 text-muted"></span></button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- row start-->
                        <div class="row">

                            <div class="col-md-4 col-12 mb-4">
                                <div class="card shadow bg-primary text-white border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-white">
                                                    <i class="fe fe-16 fe-shopping-bag text-default mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col pr-0">
                                                <p class="small text-white mb-0">Today Sales</p>
                                                <span class="h3 mb-0 text-white">
                                                    <?php
                                                    @$total_sales = mysqli_fetch_assoc(mysqli_query($dbc, "SELECT sum(grand_total) as total_sales FROM orders where order_date='$current_date' "))['total_sales'];
                                                    $total = isset($total_sales) ? $total_sales : "0";
                                                    echo number_format($total);
                                                    ?>
                                                </span>
                                                <!--   <span class="small text-white">+5.5%</span> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-12 mb-4">
                                <div class="card shadow bg-primary text-white border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-white">
                                                    <i class="fe fe-16 fe-shopping-bag text-default mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col pr-0">
                                                <p class="small text-white mb-0">Today Purchase</p>
                                                <span class="h3 mb-0 text-white">
                                                    <?php
                                                    @$total_purchase = mysqli_fetch_assoc(mysqli_query($dbc, "SELECT sum(grand_total) as total_sales FROM purchase where purchase_date='$current_date' "))['total_sales'];
                                                    echo $total_purchase2 = isset($total_purchase) ? $total_purchase : "0";
                                                    ?>
                                                </span>
                                                <!--   <span class="small text-white">+5.5%</span> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-12 mb-4">
                                <div class="card shadow bg-primary text-white border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-white">
                                                    <i class="fe fe-16 fe-shopping-bag text-default mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col pr-0">
                                                <p class="small text-white mb-0">Today Profit</p>
                                                <span class="h3 mb-0 text-white">
                                                    <span class="h3 mb-0 text-white">
                                                        <?php
                                                        // Calculate today's total profit
                                                        @$total_profit = mysqli_fetch_assoc(mysqli_query($dbc, "
     SELECT 
    COALESCE(SUM((o.rate - p.rate) * o.quantity), 0) AS total_profit
FROM 
    order_item o
LEFT JOIN 
    purchase_item p 
ON 
    o.product_id = p.product_id
LEFT JOIN 
    orders ord 
ON 
    o.order_id = ord.order_id
WHERE 
    ord.order_date = '$current_date'
    "))['total_profit'];
                                                        $total_profit = isset($total_profit) ? $total_profit : 0;

                                                        echo  number_format($total_profit);
                                                        ?>
                                                    </span>
                                                </span>
                                                <!--   <span class="small text-white">+5.5%</span> -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="col-md-6 col-xl-3 mb-4">
                                <div class="card shadow border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-primary">
                                                    <i class="fe fe-16 fe-dollar-sign text-white mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col">
                                                <p class="small text-muted mb-0">Total Sales</p>
                                                <div class="row align-items-center no-gutters">
                                                    <div class="col-12">
                                                        <span class="h3 mr-2 mb-0">
                                                            <?php
                                                            if ($UserData['user_role'] == 'admin') {
                                                                $total_sales = mysqli_fetch_assoc(mysqli_query($dbc, "SELECT sum(grand_total) as total_sales FROM orders WHERE  order_date BETWEEN '$start_of_month' AND '$end_of_month' "))['total_sales'];
                                                                $total = isset($total_sales) ? $total_sales : "0";
                                                                echo number_format($total);
                                                            } else {
                                                                echo "0";
                                                            }
                                                            ?>

                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <!-- <div class="col-md-6 col-xl-3 mb-4">
                                <div class="card shadow border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-primary">
                                                    <i class="fe fe-16 fe-activity text-white mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col">
                                                <p class="small text-muted mb-0">Total Orders</p>
                                                <span class="h3 mb-0">
                                                    <?php
                                                    if ($UserData['user_role'] == 'admin') {
                                                        @$total_orders = mysqli_fetch_assoc(mysqli_query($dbc, "SELECT count(*) as total_orders FROM orders WHERE order_date BETWEEN '$start_of_month' AND '$end_of_month'"))['total_orders'];
                                                        echo $total = isset($total_orders) ? $total_orders : "0";
                                                    } else {
                                                        echo "0";
                                                    }
                                                    ?>

                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->

                        </div><!-- First row end -->

                        <div class="row">


                            <div class="col-md-6 col-12 mb-4">
                                <div class="card shadow border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-primary">
                                                    <i class="fe fe-16 fe-shopping-cart text-white mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col pr-0">
                                                <p class="small text-muted mb-0">Purchase Bill Quantity</p>
                                                <span class="h3 mb-0 ">
                                                    <?php
                                                    // Count today's total purchases
                                                    @$total_purchases = mysqli_fetch_assoc(mysqli_query($dbc, "
        SELECT 
            COUNT(*) AS total_purchases
        FROM 
            purchase    
        WHERE 
            purchase_date = '$current_date'
    "))['total_purchases'];
                                                    $total_purchases = isset($total_purchases) ? $total_purchases : 0;

                                                    echo  number_format($total_purchases);
                                                    ?>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-12 mb-4">
                                <div class="card shadow border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-primary">
                                                    <i class="fe fe-16 fe-shopping-cart text-white mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col pr-0">
                                                <p class="small text-muted mb-0">Sale Bill Quantity</p>
                                                <span class="h3 mb-0 ">
                                                    <?php
                                                    // Count today's total orders
                                                    @$total_orders = mysqli_fetch_assoc(mysqli_query($dbc, "
        SELECT 
            COUNT(*) AS total_orders
        FROM 
            orders
        WHERE 
            order_date = '$current_date'
    "))['total_orders'];
                                                    $total_orders = isset($total_orders) ? $total_orders : 0;

                                                    echo number_format($total_orders);
                                                    ?>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- <div class="col-md-4 col-12 mb-4">
                                <div class="card shadow border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-primary">
                                                    <i class="fe fe-16 fe-shopping-cart text-white mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col pr-0">
                                                <p class="small text-muted mb-0">Today Cash Received Order</p>
                                                <span class="h3 mb-0">
                                                    <?php
                                                    @$total_orders = mysqli_fetch_assoc(mysqli_query($dbc, "SELECT count(*) as total_orders FROM orders where order_date='$current_date' AND paid>0  AND payment_type='cash_in_hand'"))['total_orders'];
                                                    echo $total = isset($total_orders) ? $total_orders : "0";
                                                    ?>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <!-- <div class="col-md-6 col-xl-6 mb-4">
                                <div class="card shadow border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-primary">
                                                    <i class="fe fe-16 fe-dollar-sign text-white mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col">
                                                <p class="small text-muted mb-0">Total Purchase</p>
                                                <div class="row align-items-center ">
                                                    <div class="col-12">
                                                        <span class="h3 mr-2 mb-0">
                                                            <?php
                                                            if ($UserData['user_role'] == 'admin') {
                                                                @$total_sales = mysqli_fetch_assoc(mysqli_query($dbc, "SELECT sum(grand_total) as total_sales FROM purchase where purchase_date BETWEEN '$start_of_month' AND '$end_of_month'"))['total_sales'];
                                                                $total = isset($total_sales) ? $total_sales : "0";
                                                                echo number_format($total);
                                                            } else {
                                                                echo "0";
                                                            }
                                                            ?>

                                                        </span>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                            <!-- <div class="col-md-6 col-xl-6 mb-4">
                                <div class="card shadow border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-primary">
                                                    <i class="fe fe-16 fe-activity text-white mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col">
                                                <p class="small text-muted mb-0">Total Purchase</p>
                                                <span class="h3 mb-0">
                                                    <?php
                                                    if ($UserData['user_role'] == 'admin') {
                                                        @$total_orders = mysqli_fetch_assoc(mysqli_query($dbc, "SELECT count(*) as total_orders FROM purchase WHERE purchase_date BETWEEN '$start_of_month' AND '$end_of_month' "))['total_orders'];
                                                        echo $total = isset($total_orders) ? $total_orders : "0";
                                                    } else {
                                                        echo "0";
                                                    }
                                                    ?>

                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->

                        </div><!-- Second row end  -->
                        <div class="row">
                            <div class="col-md-6">
                                <div class="card shadow eq-card mb-4">
                                    <div class="card-body">
                                        <div class="card-title">
                                            <strong>Sale</strong>
                                            <a class="float-right small text-muted" href="analytics.php">View all</a>
                                        </div>
                                        <div class="row mt-b">
                                            <div class="col-6 text-center mb-3 border-right">
                                                <p class="text-muted mb-1">Today</p>
                                                <h6 class="mb-1">
                                                    <?php
                                                    @$total_sales = mysqli_fetch_assoc(mysqli_query($dbc, "SELECT sum(grand_total) as total_sales FROM orders where order_date='$current_date' "))['total_sales'];
                                                    $total = isset($total_sales) ? $total_sales : "0";
                                                    echo number_format($total);
                                                    ?>
                                                </h6>
                                                <p class="text-muted mb-2"></p>
                                            </div>
                                            <div class="col-6 text-center mb-3">
                                                <p class="text-muted mb-1">Yesterday</p>
                                                <h6 class="mb-1"><?= getOrders($dbc, "WHERE order_date='$yesterday_date'", "grand_total") ?></h6>
                                                <p class="text-muted"></p>
                                            </div>

                                            <div class="col-6 text-center border-right">
                                                <p class="text-muted mb-1">This Week</p>
                                                <h6 class="mb-1"><?= getOrders($dbc, "WHERE order_date BETWEEN '$start' AND '$end' ", "grand_total") ?></h6>
                                                <p class="text-muted mb-2"></p>
                                            </div>
                                            <div class="col-6 text-center">
                                                <p class="text-muted mb-1">Last Week</p>
                                                <h6 class="mb-1"><?= getOrders($dbc, "WHERE order_date BETWEEN '$start_week' AND '$end_week' ", "grand_total") ?></h6>
                                                <p class="text-muted"></p>
                                            </div>
                                        </div>
                                        <div class="chart-widget">
                                            <div id="columnChartWidget" width="300" height="200"></div>
                                        </div>
                                    </div> <!-- .card-body -->
                                </div>
                            </div> <!-- .col -->
                            <div class="col-md-6 card-height">
                                <div class="table-card  card shadow mb-4 p-4 ">
                                    <div class="eq-card ">
                                        <div class="card-title">
                                            <strong>Today Bills</strong>
                                        </div>
                                        <table class="table">
                                            <thead class="w-100">
                                                <tr>
                                                    <th>Sr</th>
                                                    <th>Bill No</th>
                                                    <th>Grand Total</th>
                                                    <th>Profit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                // Query to get today's orders along with profit
                                                $query = "
            SELECT 
                ord.order_id AS bill_no,
                ord.grand_total,
                COALESCE(SUM((oi.rate - pi.rate) * oi.quantity), 0) AS profit
            FROM 
                orders ord
            LEFT JOIN 
                order_item oi ON ord.order_id = oi.order_id
            LEFT JOIN 
                purchase_item pi ON oi.product_id = pi.product_id
            WHERE 
                ord.order_date = '$current_date'
            GROUP BY 
                ord.order_id
        ";

                                                $result = mysqli_query($dbc, $query);
                                                $serial_number = 1; // Start serial number from 1

                                                while ($row = mysqli_fetch_assoc($result)) {
                                                    $bill_no = $row['bill_no'];
                                                    $grand_total = number_format($row['grand_total']);
                                                    $profit = number_format($row['profit']);

                                                    echo "
            <tr>
                <td>{$serial_number}</td>
                <td>{$bill_no}</td>
                <td>{$grand_total}</td>
                <td>{$profit}</td>
            </tr>
            ";

                                                    $serial_number++;
                                                }
                                                ?>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>

                                <div class="row">




                                    <!-- <div class="col-md-6 col-xl-3 mb-4">
                                <div class="card shadow border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-primary">
                                                    <i class="fe fe-16 fe-dollar-sign text-white mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col">
                                                <p class="small text-muted mb-0">Total Pending Amount</p>
                                                <div class="row align-items-center no-gutters">
                                                    <div class="col-12">
                                                        <span class="h3 mr-2 mb-0">
                                                            <?php
                                                            $total_sales = mysqli_fetch_assoc(mysqli_query($dbc, "SELECT sum(due) as total_sales FROM orders WHERE  order_date='$current_date' AND payment_type='cash_in_hand' "))['total_sales'];
                                                            $total = isset($total_sales) ? $total_sales : "0";
                                                            echo number_format($total);
                                                            ?>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->
                                    <!-- <div class="col-md-6 col-xl-3 mb-4">
                                <div class="card shadow border-0">
                                    <div class="card-body">
                                        <div class="row align-items-center">
                                            <div class="col-3 text-center">
                                                <span class="circle circle-sm bg-primary">
                                                    <i class="fe fe-16 fe-activity text-white mb-0"></i>
                                                </span>
                                            </div>
                                            <div class="col">
                                                <p class="small text-muted mb-0">Pending Order's Amount</p>
                                                <span class="h3 mb-0">
                                                    <?php
                                                    @$total_orders = mysqli_fetch_assoc(mysqli_query($dbc, "SELECT count(*) as total_orders FROM orders WHERE order_date='$current_date' AND due>0  AND payment_type='cash_in_hand' "))['total_orders'];
                                                    echo $total = isset($total_orders) ? $total_orders : "0";
                                                    ?>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> -->


                                </div>









                            </div> <!-- .col-12 -->
                        </div> <!-- .row -->


                    </div> <!-- .container-fluid -->

                    <div class="modal fade modal-shortcut modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="defaultModalLabel">Shortcuts</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body px-5">
                                    <div class="row align-items-center">
                                        <div class="col-6 text-center">
                                            <div class="squircle bg-success justify-content-center">
                                                <i class="fe fe-cpu fe-32 align-self-center text-white"></i>
                                            </div>
                                            <p>Control area</p>
                                        </div>
                                        <div class="col-6 text-center">
                                            <div class="squircle bg-primary justify-content-center">
                                                <i class="fe fe-activity fe-32 align-self-center text-white"></i>
                                            </div>
                                            <p>Activity</p>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-6 text-center">
                                            <div class="squircle bg-primary justify-content-center">
                                                <i class="fe fe-droplet fe-32 align-self-center text-white"></i>
                                            </div>
                                            <p>Droplet</p>
                                        </div>
                                        <div class="col-6 text-center">
                                            <div class="squircle bg-primary justify-content-center">
                                                <i class="fe fe-upload-cloud fe-32 align-self-center text-white"></i>
                                            </div>
                                            <p>Upload</p>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-6 text-center">
                                            <div class="squircle bg-primary justify-content-center">
                                                <i class="fe fe-users fe-32 align-self-center text-white"></i>
                                            </div>
                                            <p>Users</p>
                                        </div>
                                        <div class="col-6 text-center">
                                            <div class="squircle bg-primary justify-content-center">
                                                <i class="fe fe-settings fe-32 align-self-center text-white"></i>
                                            </div>
                                            <p>Settings</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
        </main> <!-- main -->
    </div> <!-- .wrapper -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/simplebar.min.js"></script>
    <script src='js/daterangepicker.js'></script>
    <script src='js/jquery.stickOnScroll.js'></script>
    <script src="js/tinycolor-min.js"></script>
    <script src="js/config.js"></script>
    <script src="js/d3.min.js"></script>
    <script src="js/topojson.min.js"></script>
    <script src="js/datamaps.all.min.js"></script>
    <script src="js/datamaps-zoomto.js"></script>
    <script src="js/datamaps.custom.js"></script>
    <script src="js/Chart.min.js"></script>
    <script>
        /* defind global options */
        Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
        Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
    <script src="js/gauge.min.js"></script>
    <script src="js/jquery.sparkline.min.js"></script>
    <script src="js/apexcharts.min.js"></script>
    <script src="js/apexcharts.custom.js"></script>
    <script src='js/jquery.mask.min.js'></script>
    <script src='js/select2.min.js'></script>
    <script src='js/jquery.steps.min.js'></script>
    <script src='js/jquery.validate.min.js'></script>
    <script src='js/jquery.timepicker.js'></script>
    <script src='js/dropzone.min.js'></script>
    <script src='js/uppy.min.js'></script>
    <script src='js/quill.min.js'></script>
    <script>
        barChartjs = document.getElementById("barChar");
        barChartjs && new Chart(barChartjs, {
            type: "bar",
            data: ChartData,
            options: ChartOptions
        });
        $('.select2').select2({
            theme: 'bootstrap4',
        });
        $('.select2-multi').select2({
            multiple: true,
            theme: 'bootstrap4',
        });
        $('.drgpicker').daterangepicker({
            singleDatePicker: true,
            timePicker: false,
            showDropdowns: true,
            locale: {
                format: 'MM/DD/YYYY'
            }
        });
        $('.time-input').timepicker({
            'scrollDefault': 'now',
            'zindex': '9999' /* fix modal open */
        });
        /** date range picker */
        if ($('.datetimes').length) {
            $('.datetimes').daterangepicker({
                timePicker: true,
                startDate: moment().startOf('hour'),
                endDate: moment().startOf('hour').add(32, 'hour'),
                locale: {
                    format: 'M/DD hh:mm A'
                }
            });
        }
        var start = moment().subtract(29, 'days');
        var end = moment();

        function cb(start, end) {
            $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
        $('#reportrange').daterangepicker({
            startDate: start,
            endDate: end,
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);
        cb(start, end);
        $('.input-placeholder').mask("00/00/0000", {
            placeholder: "__/__/____"
        });
        $('.input-zip').mask('00000-000', {
            placeholder: "____-___"
        });
        $('.input-money').mask("#.##0,00", {
            reverse: true
        });
        $('.input-phoneus').mask('(000) 000-0000');
        $('.input-mixed').mask('AAA 000-S0S');
        $('.input-ip').mask('0ZZ.0ZZ.0ZZ.0ZZ', {
            translation: {
                'Z': {
                    pattern: /[0-9]/,
                    optional: true
                }
            },
            placeholder: "___.___.___.___"
        });
        // editor
        var editor = document.getElementById('editor');
        if (editor) {
            var toolbarOptions = [
                [{
                    'font': []
                }],
                [{
                    'header': [1, 2, 3, 4, 5, 6, false]
                }],
                ['bold', 'italic', 'underline', 'strike'],
                ['blockquote', 'code-block'],
                [{
                        'header': 1
                    },
                    {
                        'header': 2
                    }
                ],
                [{
                        'list': 'ordered'
                    },
                    {
                        'list': 'bullet'
                    }
                ],
                [{
                        'script': 'sub'
                    },
                    {
                        'script': 'super'
                    }
                ],
                [{
                        'indent': '-1'
                    },
                    {
                        'indent': '+1'
                    }
                ], // outdent/indent
                [{
                    'direction': 'rtl'
                }], // text direction
                [{
                        'color': []
                    },
                    {
                        'background': []
                    }
                ], // dropdown with defaults from theme
                [{
                    'align': []
                }],
                ['clean'] // remove formatting button
            ];
            var quill = new Quill(editor, {
                modules: {
                    toolbar: toolbarOptions
                },
                theme: 'snow'
            });
        }
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
    <script>
        var uptarg = document.getElementById('drag-drop-area');
        if (uptarg) {
            var uppy = Uppy.Core().use(Uppy.Dashboard, {
                inline: true,
                target: uptarg,
                proudlyDisplayPoweredByUppy: false,
                theme: 'dark',
                width: 770,
                height: 210,
                plugins: ['Webcam']
            }).use(Uppy.Tus, {
                endpoint: 'https://master.tus.io/files/'
            });
            uppy.on('complete', (result) => {
                console.log('Upload complete! We’ve uploaded these files:', result.successful)
            });
        }
    </script>
    <script src="js/apps.js"></script>
</body>

</html>