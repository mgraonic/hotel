- What classes does each implementation include? Are the lists the same?

Both implementations include CartEntry, ShoppingCart, and Order. However, they are leveraged differently.

- Write down a sentence to describe each class.
## Implementation A
CartEntry - Tracks prices and quantity of each entry
ShoppingCart - Keeps track of all entries
Order - Instantiates a new ShoppingCart, calculates the cost of each item in the cart, and calculates the total price of the cart, including sales tax.

## Implementation B
CartEntry - Tracks price and quantity of each entry. Also calculates the price for each entry.
ShoppingCart - Tracks all entries in the cart and calculates the subtotal (pre-tax) for the cart.
Order - Instantiates a new ShoppingCart and calculates the final price of the cart with tax.


- How do the classes relate to each other? It might be helpful to draw a diagram on a whiteboard or piece of paper.
## Implementation A

The Order class has the most responsibilities. It creates an instance of ShoppingCart and relies heavily on the data tracked by ShoppingCart and CartEntry to calculate the cost of the order with taxes.

## Implementation B

The responsibilities are more clearly delineated. Each class does its own calculations.
Each CartEntry can calculate its own price based on item quantity. Each ShoppingCart can calculate a subtotal for the items it contains. The Order class only has to instantiate a new ShoppingCart and calculate the total with tax. The Order class only has to know that a cart exists and that it has a method called "price."


- What **data** does each class store? How (if at all) does this differ between the two implementations?

CartEntry stores individual items. ShoppingCart stores a collection of items. The Order class stores an instance of a ShoppingCart and the total price after tax.

- What **methods** does each class have? How (if at all) does this differ between the two implementations?

Aside from the accessors, the classes in Implementation A have no methods. The Order class is the only one enabled with methods. In Implementation B, each class has a method that performs a calculation using the data it stores (ie, a ShoppingCart can calculate the price of the items it contains)

- Consider the `Order#total_price` method. In each implementation:
    - Is logic to compute the price delegated to "lower level" classes like `ShoppingCart` and `CartEntry`, or is it retained in `Order`?
    In Implementation A, the logic is retained in the Order class. In Implementation B, the logic is delegated.
    - Does `total_price` directly manipulate the instance variables of other classes?
    In Implementation A, the Order class relies on knowledge of the instance variables in other classes to calculate the final price. In Implementation B, total_price only relies on the existence of the cart variable that it created.

- If we decide items are cheaper if bought in bulk, how would this change the code? Which implementation is easier to modify?
Implementation B would be easier to modify because of the loosely coupled design. Bulk items do not have a unit price and Implementation B can calculate the total price of the order without knowledge about specific items. The change would only be implemented in CartEntry.

- Which implementation better adheres to the single responsibility principle?
Implementation B
- Bonus question once you've read Metz ch. 3: Which implementation is more loosely coupled? Implementation B

# Revisiting Hotel
My implementation of Hotel is incomplete - I did not finish Wave 3 and the code relating to blocked rooms is not working. However, my functional code does not appear to have classes that directly manipulate the attributes of another class. The Hotel class is only in charge of creating a new instance of a Reservation and fetching Reservation objects that correspond to a particular date.

The Reservation class is responsible for calculation of cost, length of stay, and determining whether it overlaps with any given date range. I started to build a sub-class for a Block of rooms that inherited attributes from the Reservation class, which would further de-couple tracking of Reservations that are "blocked."
