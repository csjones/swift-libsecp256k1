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
    targets: [
        .target(
            name: "secp256k1",
            path: "Sources/secp256k1",
            exclude: [
                "secp256k1/src/asm",
                "secp256k1/src/bench_ecdh.c",
                "secp256k1/src/bench_ecmult.c",
                "secp256k1/src/bench_internal.c",
                "secp256k1/src/bench_recover.c",
                "secp256k1/src/bench_sign.c",
                "secp256k1/src/bench_verify.c",
                "secp256k1/src/gen_context.c",
                "secp256k1/src/tests_exhaustive.c",
                "secp256k1/src/tests.c",
                "secp256k1/src/valgrind_ctime_test.c"
            ],
            cSettings: [
                .headerSearchPath("secp256k1"),
                .define("USE_NUM_NONE"),
                .define("USE_FIELD_INV_BUILTIN"),
                .define("USE_SCALAR_INV_BUILTIN"),
                .define("USE_FIELD_10X26"),
                .define("USE_SCALAR_8X32"),
                .define("ECMULT_WINDOW_SIZE", to: "15", nil),
                .define("ECMULT_GEN_PREC_BITS", to: "4", nil)
            ]
        ),
        .testTarget(
            name: "secp256k1Tests",
            dependencies: ["secp256k1"]
        ),
    ],
    cLanguageStandard: .c89
)
