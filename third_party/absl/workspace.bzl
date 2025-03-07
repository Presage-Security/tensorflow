"""Provides the repository macro to import absl."""

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    """Imports absl."""

    # Attention: tools parse and update these lines.
    # LINT.IfChange
    ABSL_COMMIT = "4a2c63365eff8823a5221db86ef490e828306f9d "
    ABSL_SHA256 = "338420448b140f0dfd1a1ea3c3ce71b3bc172071f24f4d9a57d59b45037da440"

    # LINT.ThenChange(//tensorflow/lite/tools/cmake/modules/abseil-cpp.cmake)
    #set to empty to use ABSL_COMMIT prefix instead
    ABSL_RELEASE = "20240116.0"

    SYS_DIRS = [
        "algorithm",
        "base",
        "cleanup",
        "container",
        "debugging",
        "flags",
        "functional",
        "hash",
        "memory",
        "meta",
        "numeric",
        "random",
        "status",
        "strings",
        "synchronization",
        "time",
        "types",
        "utility",
    ]
    SYS_LINKS = {
        "//third_party/absl:system.absl.{name}.BUILD".format(name = n): "absl/{name}/BUILD.bazel".format(name = n)
        for n in SYS_DIRS
    }

    if not ABSL_RELEASE or ABSL_RELEASE == "":
        prefix = "abseil-cpp-{commit}".format(commit = ABSL_COMMIT)
    else:
        prefix = "abseil-cpp-{release}".format(release = ABSL_RELEASE)

    tf_http_archive(
        name = "com_google_absl",
        sha256 = ABSL_SHA256,
        build_file = "//third_party/absl:com_google_absl.BUILD",
        system_build_file = "//third_party/absl:system.BUILD",
        system_link_files = SYS_LINKS,
        strip_prefix = prefix,
        urls = tf_mirror_urls("https://github.com/abseil/abseil-cpp/archive/{commit}.tar.gz".format(commit = ABSL_COMMIT)),
    )
