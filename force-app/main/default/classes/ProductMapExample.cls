public class ProductMapExample {
    public static Map<String, String> productMap = new Map<String, String>();

    static {
        productMap.put('P001', 'Apple');
        productMap.put('P002', 'Banana');
        productMap.put('P003', 'Cherry');
    }

    public static String getProductName(String productCode) {
        return productMap.get(productCode);
    }
}