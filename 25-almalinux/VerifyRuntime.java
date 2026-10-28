class VerifyRuntime {
    public static void main(String[] args) {
        var minimum = Runtime.Version.parse("25.0.5.0.3");
        var actual = Runtime.version();
        if (actual.feature() != 25 || actual.compareTo(minimum) < 0) {
            throw new IllegalStateException("GraalVM JDK 25.0.5.0.3 or newer in 25.x required; found " + actual);
        }
        if (!System.getProperty("java.vendor.version", "").contains("GraalVM")) {
            throw new IllegalStateException("Expected a GraalVM runtime");
        }
        System.out.println("Verified " + System.getProperty("java.vendor.version") + " / " + actual);
    }
}
