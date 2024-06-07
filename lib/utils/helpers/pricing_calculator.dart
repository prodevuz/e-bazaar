class PricingCalculator {
  PricingCalculator._(); // Private constructor to prevent instantiation of the class

  // Method to calculate the total price including tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location); // Get the tax rate for the given location
    double taxAmount = productPrice * taxRate; // Calculate the tax amount
    double shippingCost = getShippingCost(location); // Get the shipping cost for the given location
    double totalPrice = productPrice + taxAmount + shippingCost; // Calculate the total price

    return totalPrice; // Return the total price
  }

  // Method to calculate the shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location); // Get the shipping cost for the given location
    return shippingCost.toStringAsFixed(2); // Return the shipping cost formatted as a string with two decimal places
  }

  // Method to calculate the tax amount
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location); // Get the tax rate for the given location
    double getTaxAmount = productPrice * taxRate; // Calculate the tax amount
    return getTaxAmount.toStringAsFixed(2); // Return the tax amount formatted as a string with two decimal places
  }

  // Method to get the tax rate for a given location (currently a dummy implementation)
  static double getTaxRateForLocation(String location) => 0.10;

  // Method to get the shipping cost for a given location (currently a dummy implementation)
  static double getShippingCost(String location) => 5.00;
}
