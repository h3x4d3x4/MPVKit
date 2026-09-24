// swift-tools-version:5.8

import PackageDescription

// LGPL build of MPVKit: FFmpeg and libmpv built without --enable-gpl,
// --enable-nonfree or --enable-version3 (FFmpeg reports "LGPL version 2.1 or
// later"); TLS via Apple's SecureTransport instead of GnuTLS. One set of
// xcframeworks for iOS, the iOS Simulator and macOS. Tag: 0.41.0-lgpl2.
let package = Package(
    name: "MPVKit",
    platforms: [.macOS(.v11), .iOS(.v14)],
    products: [
        .library(
            name: "MPVKit-LGPL",
            targets: ["_MPVKit-LGPL"]
        ),
        .library(
            name: "Libmpv-LGPL",
            targets: ["Libmpv-LGPL"]
        ),
    ],
    targets: [
        .target(
            name: "_MPVKit-LGPL",
            dependencies: [
                "Libmpv-LGPL", "_FFmpeg-LGPL", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
            ],
            path: "Sources/_MPVKit-GPL",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg-LGPL",
            dependencies: [
                "Libavcodec-LGPL", "Libavdevice-LGPL", "Libavfilter-LGPL", "Libavformat-LGPL", "Libavutil-LGPL", "Libswresample-LGPL", "Libswscale-LGPL",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg-GPL",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                // FFmpeg's TLS (--enable-securetransport).
                .linkedFramework("Security"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),

        .binaryTarget(
            name: "Libmpv-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl2/Libmpv.xcframework.zip",
            checksum: "5f26055bd66505c39c137e587bf9a719b6e45992b1739d04cfe51294fb018d7e"
        ),
        .binaryTarget(
            name: "Libavcodec-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl2/Libavcodec.xcframework.zip",
            checksum: "f6dcbee6ffcd92afb3848087a84c0de8519e2976d3efac84d88ac70df13fcb7b"
        ),
        .binaryTarget(
            name: "Libavdevice-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl2/Libavdevice.xcframework.zip",
            checksum: "62145b3e144012beca01ede0e75caee959a255cc6d5034751398bef0c0e76fde"
        ),
        .binaryTarget(
            name: "Libavformat-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl2/Libavformat.xcframework.zip",
            checksum: "b00d63b520fa6a81157ddbf92cb1b519ddf84908668ee92fa3a9bf7c3a152f2e"
        ),
        .binaryTarget(
            name: "Libavfilter-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl2/Libavfilter.xcframework.zip",
            checksum: "f49ab927c744ebdc2322b9d67267269ce75b1a33c6da13c8c4c3934b2756416e"
        ),
        .binaryTarget(
            name: "Libavutil-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl2/Libavutil.xcframework.zip",
            checksum: "de307f41519b2649644478a34730bd133a5298bb03fc131c5f01ede14d0c6dbf"
        ),
        .binaryTarget(
            name: "Libswresample-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl2/Libswresample.xcframework.zip",
            checksum: "dba8de758118c931f8969ea6db505f2726f4ea834a3ae78bd0b13d696ce9dcb7"
        ),
        .binaryTarget(
            name: "Libswscale-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl2/Libswscale.xcframework.zip",
            checksum: "95a796934e2867c8816f6a13183ab221544f723d7ad65a865384a690a4eb2919"
        ),

        .binaryTarget(
            name: "Libcrypto",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libcrypto.xcframework.zip",
            checksum: "593283be2a90f7fd66f6e6ed331b2f099cf403e0926fe3b4ac09a7062b793965"
        ),
        .binaryTarget(
            name: "Libssl",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libssl.xcframework.zip",
            checksum: "ff5ffd43d015d7285fd37e4a3145b25cbd8d2842740bd629a711c299a20e226a"
        ),




        .binaryTarget(
            name: "Libunibreak",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.4/Libunibreak.xcframework.zip",
            checksum: "001087c0e927ae00f604422b539898b81eb77230ea7700597b70393cd51e946c"
        ),

        .binaryTarget(
            name: "Libfreetype",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.4/Libfreetype.xcframework.zip",
            checksum: "f2840aba1ce35e51c0595557eee82c908dac8e32108ecc0661301c06061e051c"
        ),

        .binaryTarget(
            name: "Libfribidi",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.4/Libfribidi.xcframework.zip",
            checksum: "4a55513792ef7a17893875f74cc84c56f3657e8768c07a7a96f563a11dc4b743"
        ),

        .binaryTarget(
            name: "Libharfbuzz",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.4/Libharfbuzz.xcframework.zip",
            checksum: "91558d8497d9d97bc11eeef8b744d104315893bfee8f17483d8002e14565f84b"
        ),

        .binaryTarget(
            name: "Libass",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.4/Libass.xcframework.zip",
            checksum: "1e41f5a69c74f6c6407aab84a65ccd0b34e73fa44465f488f99bf22bd61b070d"
        ),


        .binaryTarget(
            name: "Libbluray",
            url: "https://github.com/mpvkit/libbluray-build/releases/download/1.4.0/Libbluray.xcframework.zip",
            checksum: "bc037d34e2b0b5ab7f202fb371f5fb298136cc66fdf406c2172185d06f53f18d"
        ),

        .binaryTarget(
            name: "Libuavs3d",
            url: "https://github.com/mpvkit/libuavs3d-build/releases/download/1.2.1-xcode/Libuavs3d.xcframework.zip",
            checksum: "1e69250279be9334cd2f6849abdc884c8e4bb29212467b6f071fdc1ac2010b6b"
        ),

        .binaryTarget(
            name: "Libdovi",
            url: "https://github.com/mpvkit/libdovi-build/releases/download/3.3.2/Libdovi.xcframework.zip",
            checksum: "e693e239808350868e79c5448ef9f02e2716bc822dd8632a41a368a1eae5ca7d"
        ),

        .binaryTarget(
            name: "MoltenVK",
            url: "https://github.com/mpvkit/moltenvk-build/releases/download/1.4.1/MoltenVK.xcframework.zip",
            checksum: "9bd1ca1e4563bacd25d6e55d37b10341d50b2601bc2684bc332188e79daa2b79"
        ),

        .binaryTarget(
            name: "Libshaderc_combined",
            url: "https://github.com/mpvkit/libshaderc-build/releases/download/2025.5.0/Libshaderc_combined.xcframework.zip",
            checksum: "758047b615708575b580eb960a2d083f760a29dc462d6eaa360416c946ce433b"
        ),

        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/mpvkit/lcms2-build/releases/download/2.17.0/lcms2.xcframework.zip",
            checksum: "dc0dce0606f6ab6841a8ec5a6bd4448e2f3ef00661a050460f806c9393dc6982"
        ),

        // Libplacebo: switched from h3x4d3x4/MPVKit/0.41.0-patched (macOS-only) to
        // mpvkit/libplacebo-build/7.360.1 (full xcframework: ios-arm64, ios simulator,
        // macos, maccatalyst, tvos, xros). The fork's libmpv + FFmpeg artifacts at
        // 0.41.0-lgpl1 are linked against libplacebo 7.360 (export _pl_log_create_360),
        // and this upstream xcframework provides the matching ABI on every slice.
        // Required so the iOS Libmpv-LGPL slice can actually link against libplacebo.
        .binaryTarget(
            name: "Libplacebo",
            url: "https://github.com/mpvkit/libplacebo-build/releases/download/7.360.1/Libplacebo.xcframework.zip",
            checksum: "2fa3d54cb81f302d6f11c7b2f509af30944381c3b11ee9d35096eb4637a6e2dd"
        ),

        .binaryTarget(
            name: "Libdav1d",
            url: "https://github.com/mpvkit/libdav1d-build/releases/download/1.5.2-xcode/Libdav1d.xcframework.zip",
            checksum: "8a8b78e23e28ecc213232805f3c1936141fc9befe113e87234f4f897f430a532"
        ),

        .binaryTarget(
            name: "Libuchardet",
            url: "https://github.com/mpvkit/libuchardet-build/releases/download/0.0.8-xcode/Libuchardet.xcframework.zip",
            checksum: "503202caa0dafb6996b2443f53408a713b49f6c2d4a26d7856fd6143513a50d7"
        ),

        .binaryTarget(
            name: "Libluajit",
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0-xcode/Libluajit.xcframework.zip",
            checksum: "8e76f267ee100ff5f3bbde7641b2240566df722241cdf8e135be7ef3d29e237a"
        ),
    ]
)
