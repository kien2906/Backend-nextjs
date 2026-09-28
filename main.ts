import Product from "./product";
import ShoppingCart from "./card";

const p1 = new Product("1", "Ihone", 1000);
const p2 = new Product("2", "Tai nghe", 100);
const p3 = new Product("3", "Ốp lưng", 20);

const Shoppingcart = new ShoppingCart();

Shoppingcart.addtoCart(p1, 2);
Shoppingcart.addtoCart(p2, 3);
Shoppingcart.addtoCart(p3, 3);

Shoppingcart.addtoCart(p1,3)
console.log(Shoppingcart.getTotalPrice())