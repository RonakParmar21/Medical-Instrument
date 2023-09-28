function add_to_cart(sub_product_id, model_no, q, price) {
    const q1 = q;
    console.log(q1);
    let cart = localStorage.getItem("cart");
    
    if(cart == null) {
        // no cart yet
        let products = [];
        let product = { sub_product_id:sub_product_id, model_no:model_no, quantity:1, price:price}
        
        
        
        products.push(product);
        
        localStorage.setItem("cart",JSON.stringify(products));
        
        console.log(q);
        console.log(q1);
        alert("product is added to cart")
//        console.log("Product is added for the first time");
    } else {
        // cart is already present
        let pcart = JSON.parse(cart);
        
        let oldProduct = pcart.find((item)=> item.sub_product_id == sub_product_id) 
        
        if(oldProduct) {
            // we have to increase the quantity
            oldProduct.quantity = oldProduct.quantity+1;
            
            if(q1 == 0 || oldProduct.quantity > q1) {
                alert("Out of Stock");
            } else {
            pcart.map((item)=>{
                
                if(item.sub_product_id == oldProduct.sub_product_id) {
                    item.quantity = oldProduct.quantity;
                    
                }
            })
            
            localStorage.setItem("cart", JSON.stringify(pcart));
            alert("product quantity is increased, Quantity is : "+oldProduct.quantity)
//            console.log("Product quantity is increased");
            }
        } else {
            // we have to add the product
//            let product = { sub_product_id:sub_product_id, model_no:model_no, price:price}
            let product = { sub_product_id:sub_product_id, model_no:model_no, quantity:1, price:price}
            pcart.push(product)
            localStorage.setItem("cart", JSON.stringify(pcart));
            
            alert("Product is added")
//            console.log("Product is added");
        }
    }
    updateCart()
}

// update cart...

function updateCart() {
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    
//    console.log("Lenght is : ")
//    console.log(cart)
    
    if(cart == null || cart.length == 0) {
//        console.log("cart is empty");
        
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3 style='text-align:center; color:red;'>cart does not have any items</h3>");
        $(".checkout-btn").hide();
//        $(".checkout-btn").addClass('disabled');
//        $(".checkout-btn").attr('.disabled', true);
//        $(".checkout-btn").remove(".checkout-btn");
//$(".checkout-btn").removeAttr('.disabled', false);
    } else  {
        console.log(cart);
        $(".cart-items").html(`( ${cart.length} )`);
        
        let table = `
            <table class='table'>
                <thead class='thead-light'>
                    <tr>
                        
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                
                

`;
    let totalPrice = 0;
    
        cart.map((item)=>{
            
            table+=`
                <tr>
                   
                    <td> ${item.model_no} </td>
                    <td> ${item.price} </td>
                    <td> ${item.quantity} </td>
                    <td> ${item.quantity * item.price} </td>
                    <td> <button onclick='deleteItemFromCart(${item.sub_product_id})' class='btn btn-danger'>Remove</button> </td>
                </tr>
            `
            totalPrice += item.price * item.quantity;
            
        })
        
        table = table+`<tr><td><b> Total Price : ${totalPrice} </b></td></tr></table>`
        $(".cart-body").html(table);
        
        $(".checkout-btn").show();
//        $(".checkout-btn").add(".checkout-btn");
//        $(".checkout-btn").remove();
    }
 


    
}

// delete item from cart
function deleteItemFromCart(sub_product_id) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    
    let newcart = cart.filter((item)=> item.sub_product_id != sub_product_id)
    
    localStorage.setItem('cart', JSON.stringify(newcart))
    
    alert("Item is removed from the cart")
    
    updateCart();
}

$(document).ready(function() {
    updateCart();
})


function goToCheckout() {
   
   window.location="checkout.jsp";
}
    