// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "MPVKit",
    platforms: [.macOS(.v11), .iOS(.v14), .tvOS(.v14)],
    products: [
        .library(
            name: "MPVKit",
            targets: ["_MPVKit"]
        ),
        .library(
            name: "MPVKit-GPL",
            targets: ["_MPVKit-GPL"]
        ),
    ],
    targets: [
        .target(
            name: "_MPVKit",
            dependencies: [
                "Libmpv", "_FFmpeg", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
            ],
            path: "Sources/_MPVKit",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg",
            dependencies: [
                "Libavcodec", "Libavdevice", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg",
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
        .target(
            name: "_MPVKit-GPL",
            dependencies: [
                "Libmpv-GPL", "_FFmpeg-GPL", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
            ],
            path: "Sources/_MPVKit-GPL",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg-GPL",
            dependencies: [
                "Libavcodec-GPL", "Libavdevice-GPL", "Libavfilter-GPL", "Libavformat-GPL", "Libavutil-GPL", "Libswresample-GPL", "Libswscale-GPL",
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
            name: "Libmpv-GPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched2/Libmpv-GPL.xcframework.zip",
            checksum: "626b399ab66d54d63928e6c8afc63c9694dae4a9b247fffe3d7ba521ce77a453"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libavcodec.xcframework.zip",
            checksum: "35ac93b6d6619512fdf487a66c93814a8a4e956f874b940f185e644157fe5cc2"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libavdevice.xcframework.zip",
            checksum: "951c7ed0c6c438823fe1786cec0021a881c3003d075e0038009ea307f993f810"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libavformat.xcframework.zip",
            checksum: "6f3aa72edc41a7761dc3d4b8103c435f4e7a1ae88cc52511c0afcc23977e275e"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libavfilter.xcframework.zip",
            checksum: "5ef080d1a775c8329fb7ef68acccfa6229d4e1e043709978c1778890545a788d"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libavutil.xcframework.zip",
            checksum: "db0cc6e3b654b78e2e48a175c8137d9aca614fa8709c78978611bcd8edba4237"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libswresample.xcframework.zip",
            checksum: "09297a267c7c7edeb1e84238295e854d40f4fe2b983199a137ca716c94063fb3"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libswscale.xcframework.zip",
            checksum: "3b9a1b8aa6a8a320d3af9f86ad97aff9033724ae50c0c534306463e1dc86e8fb"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

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
            name: "Libavcodec",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libavcodec.xcframework.zip",
            checksum: "35ac93b6d6619512fdf487a66c93814a8a4e956f874b940f185e644157fe5cc2"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libavdevice.xcframework.zip",
            checksum: "951c7ed0c6c438823fe1786cec0021a881c3003d075e0038009ea307f993f810"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libavformat.xcframework.zip",
            checksum: "6f3aa72edc41a7761dc3d4b8103c435f4e7a1ae88cc52511c0afcc23977e275e"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libavfilter.xcframework.zip",
            checksum: "5ef080d1a775c8329fb7ef68acccfa6229d4e1e043709978c1778890545a788d"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libavutil.xcframework.zip",
            checksum: "db0cc6e3b654b78e2e48a175c8137d9aca614fa8709c78978611bcd8edba4237"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libswresample.xcframework.zip",
            checksum: "09297a267c7c7edeb1e84238295e854d40f4fe2b983199a137ca716c94063fb3"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched/Libswscale.xcframework.zip",
            checksum: "3b9a1b8aa6a8a320d3af9f86ad97aff9033724ae50c0c534306463e1dc86e8fb"
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

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/h3x4d3x4/MPVKit/releases/download/0.41.0-patched2/Libmpv.xcframework.zip",
            checksum: "d6fb0ca768c6372244e277643a7cb23a7abf65f513c8679d88a0929e115ff43a"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
