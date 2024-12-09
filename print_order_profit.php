

        
 <?php  include_once 'includes/head.php';
  $order=fetchRecord($dbc,"orders","order_id",$_REQUEST['i']);

    $order_item=mysqli_query($dbc,"SELECT order_item.*,product.* FROM order_item INNER JOIN product ON order_item.product_id=product.product_id WHERE order_item.order_id='".$_REQUEST['i']."'");


 ?>
<style type="text/css">
 @font-face {
    font-family: 'AvantGardeBookBT';
    src: url('AvantGardeBookBT.ttf') format('truetype');
    font-weight: normal;
    font-style: normal;
}

/* The following rules are deprecated. */ 
@font-face {
    font-family: 'AvantGardeBookBT';
    src: url('AvantGardeBookBT.ttf') format('truetype');
    font-weight: normal;
    font-style: normal;
}

body,p { 
   font-family: 'AvantGardeBookBT'; 
   font-weight: normal; 
   font-style: normal; 

}
input{
   font-family:'Lucida Casual', 'Comic Sans MS';    
   
}
</style>
    <div class="page-content-wrapper">
    <div class="page-content">
<div id="invoice">

    <div class="invoice overflow-auto">  
        <div style="min-width: 600px">
            <header>
                <div class="row">
                     <div class="col-sm-5">
                         <img src="img/logo/<?=$get_company['logo']?>" width="80" height="80" class="img-fluid float-right">
                </div>
        <div class="col-sm-7 mt-3">
          <h2 style="margin-left: -20px; color: red;font-weight: bold;"><?=$get_company['name']?></h2>
          <p style="margin-left: -20px; font-weight: bold;"><?=$get_company['company_phone']?>-<?=$get_company['email']?></p>
          <p style="margin-left: -20px; font-weight: bold;margin-top: -10px;"><?=$get_company['address']?></p>
  

          
        </div>
        <center style="width: 100%;margin-top: -5px;"></center>
      </div>
            </header>
            <main>
                <div class="row contacts">
                    <div class="col invoice-to">
                        <div class="text-gray-light">ORDER'S DETAILS:</div>
                        <h2 class="to"><?=ucfirst($order['client_name'])?></h2>
                        <div class="email"><?=$order['client_contact']?></div>
                        <div class="address"><?=$order['address']?></div>
                    </div>
                    <div class="col invoice-details">
                        <h1 class="invoice-id">ORDER # <?=$order['order_id']?></h1>
                        <div class="date">Order Type: Delivery</div>
                        <div class="date">Order Date/Time: <?=$order['timestamp']?></div>
                    </div>
                </div>
                <table border="0" cellspacing="0" cellpadding="0">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th class="text-left">Product</th>
                        <th class="text-right">PRICE</th>
                        <th class="text-right">QUANTITY</th>
                        <th class="text-right">TOTAL</th>
                    </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $c=0;
                        while($row = $order_item->fetch_array()) { $c++;
                $product_id = $row['product_id'];
                $getProduct = $dbc->query("SELECT * FROM product WHERE product_id='$product_id'");
                $fetchProduct = $getProduct->fetch_assoc();
                $getCategory = $dbc->query("SELECT * FROM categories WHERE categories_id='$fetchProduct[category_id]'");
                $fetchCategory = $getCategory->fetch_assoc();
                       ?>
                        <tr>
                            <td class="no"><?=$c?></td>
                            <td class="text-left"><h3><?=$row['product_name']?></h3></td>
                            <td class="unit"><h3><?=$row['rate']?></h3></td>
                            <td class="qty"><?=$row['quantity']?></h3></td>
                            <td class="total"><?=$row['total']?></h3></td>
                        </tr>

                   <?php } ?>
                    </tbody>
                    <tfoot>

        <?php
        // $sql = "SELECT * FROM customers WHERE customer_id = '$clientName_id'";

        //     $result = $connect->query($sql);

        //     while($row = $result->fetch_array()) {
        //         $customer_id = $row[0];
        //         $customer_name = $row[1];
        //         $customer_blance = '';
        //     $sqll = "SELECT * FROM transactions WHERE customer_id='$clientName_id' ORDER BY transaction_id DESC limit 1";
        //     $resultt = $connect->query($sqll);
        //     while($roww = $resultt->fetch_array()) {
        //          $customer_blance = $roww['balance'];
        //          $customer_credit = $roww['credit'];
        //     }//while transation 
        // }
            ?> 
                    
        
                    <!--<tr>
                        <td colspan="2"></td>
                        <td colspan="2">SUBTOTAL</td>
                        <td>$5,200.00</td>
                    </tr>-->
                                            <tr>
                            <td colspan="2"></td>
                            <td colspan="2">GRAND TOTAL</td>
                            <td><?=$order['grand_total']?></td>
                        </tr>
                     <tr>
                        <td colspan="2"></td>
                        <td colspan="2">AMOUNT PAID</td>
                        <td><?=$order['paid']?></td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                        <td colspan="2">DUE AMOUNT</td>
                        <td><?=$order['due']?></td>
                    </tr>
                    <?php   
    $net_profit=0;
         $sql = "SELECT * FROM order_item WHERE order_id = '".$_REQUEST['i']."'";
            $query = $connect->query($sql);
    while ($result = $query->fetch_assoc()) {
          $product_id= $result['product_id'];
         $sold_quantity= $result['quantity'];
         $sold_rate= $result['rate'];
        
    $sql_item = "SELECT * FROM product WHERE product_id = '$product_id'";
    $query_item = $connect->query($sql_item);
    while ($result_item = $query_item->fetch_assoc()) {
         $product_purchase= $result_item['purchase_rate'];
    
    $sold_income = $sold_quantity * $sold_rate;
    $purchase_income = $product_purchase * $sold_quantity; 
}
    $net_profit+=$sold_income-$purchase_income ;
 }//while
        ?>
                    <tr>
                        <td colspan="2"></td>
                        <td colspan="2">PROFIT</td>
                        <td><?=$net_profit?></td>
                    </tr>
                    </tfoot>
                </table>
                <!--<div class="thanks">Thank you!</div>-->
                <div class="notices">
                    <h4><strong>Thank you!</strong></h4>
                    <p class="notice">Thank you so much for choosing<b class="name">
                            <?=$get_company['name']?>                        </b> </p>
                </div>
            </main>
            <footer>
                Invoice was created on a computer and is valid without the signature and seal.
            </footer>
        </div>
        <!--DO NOT DELETE THIS div. IT is responsible for showing footer always at the bottom-->
        <div></div>
    </div>
</div>
    </div>
</div>
<style>
    #invoice{
        padding: 30px;
    }

    .invoice {
        position: relative;
        background-color: #FFF;
        min-height: 680px;
        padding: 15px
    }

    .name{
        color: #cd0606;
    }

    .invoice header {
        padding: 10px 0;
        margin-bottom: 20px;
        border-bottom: 1px solid #cd0606
    }

    .invoice .company-details {
        text-align: right
    }

    .invoice .company-details .name {
        margin-top: 0;
        margin-bottom: 0
    }

    .invoice .contacts {
        margin-bottom: 20px
    }

    .invoice .invoice-to {
        text-align: left
    }

    .invoice .invoice-to .to {
        margin-top: 0;
        margin-bottom: 0
    }

    .invoice .invoice-details {
        text-align: right
    }

    .invoice .invoice-details .invoice-id {
        margin-top: 0;
        color: #cd0606;
    }

    .invoice main {
        padding-bottom: 50px
    }

    .invoice main .thanks {
        margin-top: -100px;
        font-size: 2em;
        margin-bottom: 50px
    }

    .invoice main .notices {
        padding-left: 6px;
        border-left: 6px solid #cd0606
    }

    .invoice main .notices .notice {
        font-size: 1.2em
    }

    .invoice table {
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
        margin-bottom: 20px
    }

    .invoice table td,.invoice table th {
        padding: 10px;
        background: #eee;
        border-bottom: 1px solid #fff
    }

    .invoice table th {
        white-space: nowrap;
        font-weight: 400;
        font-size: 16px
    }

    .invoice table td h3 {
        margin: 0;
        font-weight: 400;
        color: #cd0606;
        font-size: 1.2em
    }

    .invoice table .qty,.invoice table .total,.invoice table .unit {
        text-align: right;
        font-size: 1.2em
    }

    .invoice table .no {
        color: #fff;
        font-size: 1.6em;
        background: #cd0606
    }

    .invoice table .unit {
        background: #ddd
    }

    .invoice table .total {
        background: #cd0606;
        color: #fff
    }

    .invoice table tbody tr:last-child td {
        border: none
    }

    .invoice table tfoot td {
        background: 0 0;
        border-bottom: none;
        white-space: nowrap;
        text-align: right;
        padding: 10px 20px;
        font-size: 1.2em;
        border-top: 1px solid #aaa
    }

    .invoice table tfoot tr:first-child td {
        border-top: none
    }

    .invoice table tfoot tr:last-child td {
        color: #cd0606;
        font-size: 1.4em;
        border-top: 1px solid #cd0606
    }

    .invoice table tfoot tr td:first-child {
        border: none
    }

    .invoice footer {
        width: 100%;
        text-align: center;
        color: #777;
        border-top: 1px solid #aaa;
        padding: 8px 0
    }

    @media print {
        .invoice {
            font-size: 11px!important;
            overflow: hidden!important
        }

        .invoice footer {
            position: absolute;
            bottom: 10px;
            page-break-after: always
        }

        .invoice>div:last-child {
            page-break-before: always
        }
    }
</style>
