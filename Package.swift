// swift-tools-version:5.8

import PackageDescription

// LGPL build of MPVKit (FFmpeg + libmpv compiled without --enable-gpl --enable-nonfree).
// Suitable for App Store distribution. Tag: 0.41.0-lgpl1.
let package = Package(
    name: "MPVKit",
    platforms: [.macOS(.v11), .iOS(.v14), .tvOS(.v14)],
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
                "Libsmbclient", "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg-GPL",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
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
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl1/Libmpv-ios.xcframework.zip",
            checksum: "52d4382cb251817ee0c3d792a9ff88dd4a077452fb592565fd7e0e51c5572b22"
        ),
        .binaryTarget(
            name: "Libavcodec-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl1/Libavcodec-ios.xcframework.zip",
            checksum: "78813a89900d60652ddd6fc5b47fd41e42646c66e182b1d601579062c58ba201"
        ),
        .binaryTarget(
            name: "Libavdevice-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl1/Libavdevice-ios.xcframework.zip",
            checksum: "781bb426bded652d6880fd26738b8697a8dad5498766f71ffc088052d7e2f582"
        ),
        .binaryTarget(
            name: "Libavformat-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl1/Libavformat-ios.xcframework.zip",
            checksum: "2cbc5bb247a79505cb91f6da49e7b08abf80e4c5711b7c5fb2d41fcfc87eadeb"
        ),
        .binaryTarget(
            name: "Libavfilter-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl1/Libavfilter-ios.xcframework.zip",
            checksum: "4a375de1ad74b1ac492e342dc8d9c3d302a440d3dbb7c4d1ef165370f0a021ef"
        ),
        .binaryTarget(
            name: "Libavutil-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl1/Libavutil-ios.xcframework.zip",
            checksum: "831f810975c46a5d44dc13518084b186b03abbea9ba7b5980be23bc0dab3fd50"
        ),
        .binaryTarget(
            name: "Libswresample-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl1/Libswresample-ios.xcframework.zip",
            checksum: "8e4ea30a3267dfc3733c8cd19c145beffef9c008bfcfcee0867d66593d40056a"
        ),
        .binaryTarget(
            name: "Libswscale-LGPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-lgpl1/Libswscale-ios.xcframework.zip",
            checksum: "68a17d12520e12ac74ed411e580910d55385a4bc9661ce8bb58a363c12e3455f"
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
            name: "gmp",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gmp.xcframework.zip",
            checksum: "ad33c7a08f4cdcb9924c8f0e6d9a054dad33d7794b97667bf8b6fb2b236ae585"
        ),

        .binaryTarget(
            name: "nettle",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/nettle.xcframework.zip",
            checksum: "0fdf3ebf8bd7b8bc8eee837cf27261cb4c52ae520b6576a2f468656aa1691e02"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/hogweed.xcframework.zip",
            checksum: "25727c9fa67287fa0a4f4722f88bb8be669b23cd7e837e2d00870eb8a25d3f27"
        ),

        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gnutls.xcframework.zip",
            checksum: "3dbec5809339189bf9679e218c6cff387ebf8fb72745927835afc2678f5c9f4d"
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
            name: "Libsmbclient",
            url: "https://github.com/mpvkit/libsmbclient-build/releases/download/4.15.13-2512/Libsmbclient.xcframework.zip",
            checksum: "3a53375fab11bc888cc553664ea5dd902208d04f0cc21ec746302bf356246b6f"
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

        .binaryTarget(
            name: "Libplacebo",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libplacebo.xcframework.zip",
            checksum: "111dfb856c4d216911e67970c7880ff5d11a3a6c87bf14a96a8c86fe0fc5fc16"
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
