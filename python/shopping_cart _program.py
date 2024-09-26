total_items_in_cart = 0
total_cost = 0.0
has_discount = False


def add_item(price):
    global total_items_in_cart, total_cost
    total_items_in_cart += 1
    total_cost += price

def apply_discount(discount_amount):
    global total_cost, has_discount
    if not has_discount:
        total_cost -= discount_amount
        has_discount = True  

def remove_item(price):
    global total_items_in_cart, total_cost
    total_items_in_cart -= 1
    total_cost -= price

add_item(10.0)  
add_item(5.0)   
apply_discount(2.0) 

print(f"Total items in cart: {total_items_in_cart}")
print(f"Total cost: {total_cost:.2f}")
