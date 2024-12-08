<?php
session_start();
include("../../db.php");

$product_id = $_REQUEST['product_id'];

$result = mysqli_query($con, "SELECT `product_id`, `product_cat`, `product_title`, `product_price`, `product_image` FROM products WHERE product_id='$product_id'") or die("query 1 incorrect.......");

list($product_id, $product_type, $product_name, $price, $pic_name) = mysqli_fetch_array($result);

if (isset($_POST['btn_save'])) {
    $product_name = $_POST['product_name'];
    $price = $_POST['price'];
    $product_type = $_POST['product_type'];

    $price = $_POST['price'] * 73.77000;

    // Picture handling
    $picture_name = $_FILES['picture']['name'];
    $picture_type = $_FILES['picture']['type'];
    $picture_tmp_name = $_FILES['picture']['tmp_name'];
    $picture_size = $_FILES['picture']['size'];

    if ($picture_type == "image/jpeg" || $picture_type == "image/jpg" || $picture_type == "image/png" || $picture_type == "image/gif") {
        if ($picture_size <= 50000000) {
            $pic_name = time() . "_" . $picture_name;
            move_uploaded_file($picture_tmp_name, "../../product_images/" . $pic_name);
            mysqli_query($con, "UPDATE `products` SET `product_title` = '$product_name', 
                `product_cat` = '$product_type', `product_price` = '$price', `product_image` = '$pic_name' 
                WHERE `product_id` = '$product_id'") or die("Query 2 is incorrect..........");
            header("location: products_list.php");
        }
    } else {
        mysqli_query($con, "UPDATE `products` SET `product_title` = '$product_name', 
            `product_cat` = '$product_type', `product_price` = '$price', `product_image` = '$pic_name' 
            WHERE `product_id` = '$product_id'") or die("Query 2 is incorrect..........");
        header("location: products_list.php");
    }

    mysqli_close($con);
}
include "sidenav.php";
include "topheader.php";
?>
<!-- End Navbar -->
<div class="content">
    <div class="container-fluid">
        <form action="" method="post" type="form" name="form" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-header card-header-primary">
                            <h5 class="title">Edit Product</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Product Title</label>
                                        <input type="text" id="product_name" required name="product_name" value="<?php echo $product_name; ?>" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <img src='<?php echo "../../product_images/" . $pic_name ?>' style='width:50px; height:50px; border:groove #000'>
                                    <div class="">
                                        <label for="">Add Image</label>
                                        <input type="file" name="picture" class="btn btn-fill btn-success" value="<?php echo "../../product_images/" . $pic_name ?>" id="picture">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Pricing</label>
                                        <input type="text" id="price" name="price" value="<?php echo $price ?>" required class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header card-header-primary">
                            <h5 class="title">Categories</h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Product Category</label>
                                        <select id="product_type" name="product_type" required class="form-control">
                                            <option value="" style="color:black;">Select Category</option>
                                            <?php
                                            $result1 = mysqli_query($con, "SELECT * FROM `categories` ORDER BY `cat_id` ASC") or die("query 1 incorrect.....");

                                            while (list($cat_id, $cat_title) = mysqli_fetch_array($result1)) {
                                                if ($cat_id == $product_type) {
                                                    echo "<option value='$cat_id' style='color:black;' selected>$cat_title</option>";
                                                } else {
                                                    echo "<option value='$cat_id' style='color:black;'>$cat_title</option>";
                                                }
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="submit" id="btn_save" name="btn_save" required class="btn btn-fill btn-primary">Update Product</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<?php
include "footer.php";
?>
