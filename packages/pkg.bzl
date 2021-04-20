load("@npm//@bazel/typescript:index.bzl", "ts_project")
load("@build_bazel_rules_nodejs//:index.bzl", "js_library")

def pkg(name, deps = [], **kwargs):
    ts_project_name =  name + "_compile_ts"
    ts_project(
        name = ts_project_name,
        srcs = native.glob(["**/*.ts", "**/*.tsx", "**/*.js", "**/*.jsx", "**/*.json"]),
        deps = deps,
        allow_js = True,
        declaration = True,
        tsconfig = "//packages:base_tsconfig",
        **kwargs,
    )

    js_library(
        name = name,
        package_name = name,
        deps = [":" + ts_project_name],
        visibility = ["//visibility:public"],
    )
