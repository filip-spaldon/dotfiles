function pg_set --description "Sets the active PostgreSQL version from Postgres.app"
    set -l pg_version $argv[1]

    if test -z "$pg_version"
        echo "Error: You must provide a version number."
        echo "Usage: pg_set <version>"
        return 1
    end

    set -l new_path (
        for p in $PATH
            if not string match -r "^/Applications/Postgres.app/Contents/Versions/[0-9.]*/bin\$" -- $p
                echo $p
            end
        end 2> /dev/null
    )

    set -l target_bin "/Applications/Postgres.app/Contents/Versions/$pg_version/bin"

    if test -d "$target_bin"
        set -gx PATH "$target_bin" $new_path
        echo "PostgreSQL version $pg_version is now active."
        psql --version
    else
        set -gx PATH $new_path
        echo "Error: PostgreSQL version '$pg_version' not found in /Applications/Postgres.app/Contents/Versions/"
    end
end
