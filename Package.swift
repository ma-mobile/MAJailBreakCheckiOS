// swift-tools-version: 5.9
//  Package.swift
//  MAJailBreakCheck
//
//  Created by Harikrishnan V S (MA-IN) on 10/10/25.
//
import PackageDescription

let package = Package(
    name: "MAJailBreakCheck", // Replace with your desired package name
    platforms: [
        .iOS(.v13), // Specify platforms and versions your package supports
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MAJailBreakCheck",
            targets: ["MAJailBreakCheck"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MAJailBreakCheck",
            cSettings: [
                .unsafeFlags(["-fstack-protector-strong"])
            ]),
            cxxSettings: [
                .unsafeFlags(["-fstack-protector-strong"]) // Enable stack protection for C code
            ]),
            swiftSettings: [
                .unsafeFlags(["-fstack-protector-strong"]) // Enable stack protection for C code
            ]),    
            dependencies: [],
            path: "Sources/MAJailBreakCheck")
    ]
)
