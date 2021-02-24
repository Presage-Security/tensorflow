"""Loads the FP16 library, used by TF Lite."""

load("//third_party:repo.bzl", "third_party_http_archive")

def repo():
    third_party_http_archive(
        name = "FP16",
        strip_prefix = "FP16-4dfe081cf6bcd15db339cf2680b9281b8451eeb3",
        sha256 = "d973501a40c55126b31accc2d9f08d931ec3cc190c0430309a5e341d3c0ce32a",
        urls = [
            "https://mirror.tensorflow.org/github.com/Maratyszcza/FP16/archive/4dfe081cf6bcd15db339cf2680b9281b8451eeb3.zip",
            "https://github.com/Maratyszcza/FP16/archive/4dfe081cf6bcd15db339cf2680b9281b8451eeb3.zip",
        ],
        build_file = "//third_party/FP16:BUILD.bazel",
    )
