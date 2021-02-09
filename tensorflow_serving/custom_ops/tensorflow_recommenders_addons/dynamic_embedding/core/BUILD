licenses(["notice"])  # Apache 2.0

package(default_visibility = ["//visibility:public"])

# load("//tensorflow_recommenders_addons:tensorflow_recommenders_addons.bzl", "custom_op_library")

cc_binary(
    name = "_cuckoo_hashtable_ops.so",
    srcs = [
        "kernels/cuckoo_hashtable_op.cc",
        "kernels/cuckoo_hashtable_op.h",
        "ops/cuckoo_hashtable_ops.cc",
    ],
    deps = [
        "//tensorflow_serving/custom_ops/tensorflow_recommenders_addons/dynamic_embedding/core/lib/cuckoo:cuckoohash",
        "@org_tensorflow//tensorflow/cc:client_session",
        "@org_tensorflow//tensorflow/cc:const_op",
        "@org_tensorflow//tensorflow/core:all_kernels",
        "@org_tensorflow//tensorflow/core:direct_session",
        "@org_tensorflow//tensorflow/core:framework",
        "@org_tensorflow//tensorflow/core:lib",
        "@org_tensorflow//tensorflow/core:protos_all_cc",
        "@org_tensorflow//tensorflow/core/kernels:ops_util",
    ],
)
