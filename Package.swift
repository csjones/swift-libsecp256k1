// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "secp256k1",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "secp256k1",
            targets: ["secp256k1"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "secp256k1",
            path: "Sources/secp256k1",
            exclude: [
                "asm",
                "src/asm",
                "secp256k1/src/asm",
                "src/tests_exhaustive.c",
                "secp256k1/src/tests_exhaustive.c",
                "src/tests.c",
                "secp256k1/src/tests.c",
                "src/gen_context.c",
                "secp256k1/src/gen_context.c",
                "src/bench_ecdh.c",
                "secp256k1/src/bench_ecdh.c",
                "src/bench_ecmult.c",
                "secp256k1/src/bench_ecmult.c",
                "src/bench_internal.c",
                "secp256k1/src/bench_internal.c",
                "src/bench_recover.c",
                "secp256k1/src/bench_recover.c",
                "src/bench_sign.c",
                "secp256k1/src/bench_sign.c",
                "src/bench_verify.c",
                "secp256k1/src/bench_verify.c",
                "src/valgrind_ctime_test.c",
                "secp256k1/src/valgrind_ctime_test.c"
            ],
//            sources: [
//                "secp256k1/include",
//                "secp256k1/contrib",
//                "secp256k1/modules/ecdh",
//                "secp256k1/modules/recovery",
//                "secp256k1/src"
//            ],
            cSettings: [
//                .headerSearchPath(".."),
//                .headerSearchPath("../.."),
//                .headerSearchPath("../../.."),
                .headerSearchPath("secp256k1"),
                .headerSearchPath("secp256k1/src"),
                .headerSearchPath("secp256k1/include"),
                .define("USE_NUM_NONE"),
                .define("USE_FIELD_INV_BUILTIN"),
                .define("USE_SCALAR_INV_BUILTIN"),
                .define("USE_FIELD_10X26"),
                .define("USE_SCALAR_8X32"),
                .define("ECMULT_WINDOW_SIZE", to: "15", nil),
                .define("ECMULT_GEN_PREC_BITS", to: "4", nil)
            ]
        ),
//        .testTarget(
//            name: "secp256k1Tests",
//            dependencies: ["secp256k1"]),
    ],
    cLanguageStandard: .c89
)
