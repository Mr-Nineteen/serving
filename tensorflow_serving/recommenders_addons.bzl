
_TF_REVISION = "TF_REVISION"

def _recommenders_addons_tensorflow_http_archive(ctx):
    git_commit = ctx.attr.git_commit
    sha256 = ctx.attr.sha256
    patch = getattr(ctx.attr, "patch", None)

    override_git_commit = ctx.os.environ.get(_TF_REVISION)
    if override_git_commit:
        sha256 = ""
        git_commit = override_git_commit

    strip_prefix = "recommenders-addons-%s" % git_commit
    urls = [
        "https://mirror.bazel.build/github.com/tensorflow/recommenders-addons/archive/vip-dev.tar.gz",
        "https://github.com/Mr-Nineteen/recommenders-addons/archive/vip-dev.zip",
    ]
    ctx.download_and_extract(
        urls,
        "",
        sha256,
        "",
        strip_prefix,
    )
    if patch:
        ctx.patch(patch, strip = 1)

recommenders_addons_tensorflow_http_archive = repository_rule(
    implementation = _recommenders_addons_tensorflow_http_archive,
    attrs = {
        "git_commit": attr.string(mandatory = True),
        "sha256": attr.string(mandatory = True),
        "patch": attr.label(),
    },
)
