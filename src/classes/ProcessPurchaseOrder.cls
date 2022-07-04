public with sharing class ProcessPurchaseOrder {
    public ProcessPurchaseOrder() {
        PurchaseOrder order1 = new CustomerPurchaseOrder();
        PurchaseOrder order2 = new EmployeePurchaseOrder();

        processOrder(order1);                     //Customer Order
        processOrder(order2);                     //Employee Order
    }
    public static void processOrder(PurchaseOrder order) {
    system.debug('Check discount :' + order.discount());
}
}