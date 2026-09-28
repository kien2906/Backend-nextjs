import Product from "./product";

class ShoppingCart {
  private items: { product: Product; quantity: number }[] = [];

  constructor(items: { product: Product; quantity: number }[]=[]) {
    this.items = items;
  }

  addtoCart(product: Product, quantity: number): void {
    const check = this.items.find((p) => p.product.id === product.id);

    if(check){
        check.quantity+=quantity
    }else{
        this.items.push({
            product: product,
            quantity : quantity
        })
    }
  }

  getTotalPrice(): number {
    return this.items.reduce((sum, item) => {
      return sum + item.product.price * item.quantity;
    }, 0);
  }
}
export default ShoppingCart