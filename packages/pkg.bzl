load("@npm//@bazel/typescript:index.bzl", "ts_project")

def pkg(name, deps = [], **kwargs):
    ts_project(
        name = name,
        srcs = native.glob(["**/*.ts", "**/*.tsx", "**/*.js", "**/*.jsx", "**/*.json"]),
        deps = deps,
        allow_js = True,
        declaration = True,
        tsconfig = "//packages:base_tsconfig",
        visibility = ["//visibility:public"],
        **kwargs,
    )
