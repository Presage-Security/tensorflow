load("@com_google_protobuf//bazel:system_python.bzl", "system_python")

def set_up_protobuf():
    system_python(
        name = "system_python",
        minimum_python_version = "3.7",
    )
