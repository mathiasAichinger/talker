import PackageDescription

let package = Package(
    name: "talker-server",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 1),
        .Package(url: "https://github.com/vapor/mongo-provider.git", majorVersion: 1, minor: 1),
        .Package(url: "https://github.com/mathiasAichinger/talker-framework.git", majorVersion: 0, minor: 3)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
        "Tests",
    ]
)

