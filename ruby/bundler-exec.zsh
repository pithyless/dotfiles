# Automatically run Ruby scripts with "bundle exec" (but only when appropriate).
# Originally copied from: https://github.com/gma/bundler-exec

bundler-installed()
{
    which bundle > /dev/null 2>&1
}

within-bundled-project()
{
    local dir="$(pwd)"
    while [ "$(dirname $dir)" != "/" ]; do
        [ -f "$dir/Gemfile" ] && return
        dir="$(dirname $dir)"
    done
    false
}

run-with-bundler()
{
    if bundler-installed && within-bundled-project; then
        bundle exec "$@"
    else
        "$@"
    fi
}

BUNDLED_COMMANDS=(
cap
capify
cucumber
foreman
guard
haml
html2haml
jasmine
padrino
rackup
rails
rake
rake2thor
rspec
ruby
sass
sass-convert
serve
shotgun
spec
spork
thin
thor
tilt
tt
turn
unicorn
unicorn_rails
)

for CMD in $BUNDLED_COMMANDS; do
    if [[ $CMD != "bundle" && $CMD != "gem" ]]; then
        alias $CMD="run-with-bundler $CMD"
    fi
done
