<!DOCTYPE html>
<?php
include("./includes/head.php");



// $table = "orders";

// $items = "order_items";

// $id = "";

// $query = mysqli_query($conn, "SELECT * FROM $table WHERE $id = ''");
?>

<style>
    table {
        width: 100%;
    }

    table thead {
        background-color: black;
        border: 1px solid gray;
    }

    table thead tr th {
        padding: 10px 5px !important;
        color: #fff;
    }

    table tr td {
        padding: 10px 5px !important;
        border: 1px solid gray;
    }

    table .tfoot-payment-td {
        border: none !important;
    }
</style>

<header>
    <div class="row pt-5 m-0 px-2">
        <div class="col-4">
            <img src="./img/logo/<?= $get_company['logo'] ?>" width="150" height="150" alt="">
        </div>
        <div class="col-8">
            <div class="d-flex  flex-column align-items-end">
                <h1 class="text-uppercase"><?= $get_company['name'] ?></h1>
                <h3><?= $get_company['company_phone'] ?> - <?= $get_company['personal_phone'] ?></h3>
                <h5><?= $get_company['email'] ?></h5>
            </div>
        </div>
    </div>
</header>

<hr class="px-3">

<main>
    <div class="row pt-3 px-2 m-0">
        <div class="col-4 d-flex  flex-column">
            <h4>INVOICE TO:</h4>
            <h2>Aron Loeb</h2>
            <div></div>
            <p class="m-0 pb-1">P : +92 303 5672559</p>
            <p class="m-0 pb-1">E : info.arhamwaheed@gmail.com</p>
            <p class="m-0 pb-1">A : Faisalabad, Punjab, Pakistan</p>
        </div>
        <div class="col-8 d-flex  flex-column align-items-end">
            <h4>TOTAL DUE</h4>
            <h2>$12345</h2>
            <p class="m-0 pb-1">No : +92 303 5672559</p>
            <p class="m-0 pb-1">Date : 10/01/2024</p>
        </div>

        <!-- Table -->

        <div class="col-12 pt-3">
            <table>
                <thead>
                    <tr>
                        <th>Products</th>
                        <th class="text-center">Qty</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>StoryBook</td>
                        <td class="text-center">100</td>
                        <td class="text-center">5000</td>
                        <td class="text-center">50000</td>
                    </tr>
                    <tr>
                        <td>StoryBook</td>
                        <td class="text-center">100</td>
                        <td class="text-center">5000</td>
                        <td class="text-center">50000</td>
                    </tr>
                    <tr>
                        <td>StoryBook</td>
                        <td class="text-center">100</td>
                        <td class="text-center">5000</td>
                        <td class="text-center">50000</td>
                    </tr>
                    <tr>
                        <td>StoryBook</td>
                        <td class="text-center">100</td>
                        <td class="text-center">5000</td>
                        <td class="text-center">50000</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="tfoot-payment-td pt-3">
                            <h2>Payment Method</h2>
                            <p class="m-0 pb-1">Bank Name : Meezan Bank</p>
                            <p class="m-0 pb-1">Bank Account : 02020202222</p>
                        </td>
                        <td colspan="2">
                            <div class="row text-center">
                                <div class="col-6">
                                    <strong>Subtotal :</strong>
                                </div>
                                <div class="col-6">
                                    <strong>$10,000</strong>
                                </div>
                                <div class="col-6">
                                    <strong>Tax :</strong>
                                </div>
                                <div class="col-6">
                                    <strong>$1,000</strong>
                                </div>
                            </div>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</main>

<footer>
    <div class="row m-0 px-3 pt-5 text-center">
        <div class="col-12">
            <h1>Thank You For Your Purchase!</h1>
        </div>
    </div>
</footer>

<?php
include("./includes/foot.php");
?>