#!/usr/bin/env bash

args=()

if [[ ! -z "${INPUT_BUFFER_SIZE}" ]]; then
    echo "HTTP response buffer size in bytes: ${INPUT_BUFFER_SIZE}"
    args+=( "--buffer-size=${INPUT_BUFFER_SIZE}" )
fi

if [[ ! -z "${INPUT_MAX_CONNECTIONS}" ]]; then
    echo "Maximum number of HTTP connections: ${INPUT_MAX_CONNECTIONS}"
    args+=( "--max-connections=${INPUT_MAX_CONNECTIONS}" )
fi

if [[ ! -z "${INPUT_MAX_CONNECTIONS_PER_HOST}" ]]; then
    echo "Maximum number of HTTP connections per host: ${INPUT_MAX_CONNECTIONS_PER_HOST}"
    args+=( "--max-connections-per-host=${INPUT_MAX_CONNECTIONS_PER_HOST}" )
fi

if [[ ! -z "${INPUT_EXCLUDE}" ]]; then
    echo "Exclude URLs matched with given regular expressions: ${INPUT_EXCLUDE}"
    for arg in ${INPUT_EXCLUDE}; do
        args+=( "--exclude=${arg}" )
    done
fi

if [[ ! -z "${INPUT_INCLUDE}" ]]; then
    echo "Include URLs matched with given regular expressions: ${INPUT_INCLUDE}"
    for arg in ${INPUT_INCLUDE}; do
        args+=( "--include=${arg}" )
    done
fi

if [[ ! -z "${INPUT_FOLLOW_ROBOTS_TXT}" ]]; then
    echo "Follow robots.txt when scraping pages"
    args+=( "--follow-robots-txt" )
fi

if [[ ! -z "${INPUT_FOLLOW_SITEMAP_XML}" ]]; then
    echo "Scrape only pages listed in sitemap.xml"
    args+=( "--follow-sitemap-xml" )
fi

if [[ ! -z "${INPUT_HEADER=}" ]]; then
    echo "Custom headers: ${INPUT_HEADER=}"
    args+=( "--header=${INPUT_HEADER}" )
fi

if [[ ! -z "${INPUT_IGNORE_FRAGMENTS}" ]]; then
    echo "Ignore URL fragments"
    args+=( "--ignore_fragments" )
fi

if [[ ! -z "${INPUT_JSON}" ]]; then
    echo "Output results in JSON"
    args+=( "--json" )
fi

if [[ ! -z "${INPUT_MAX_REDIRECTIONS}" ]]; then
    echo "Maximum number of redirections: ${INPUT_MAX_REDIRECTIONS}"
    args+=( "--max-redirections=${INPUT_MAX_REDIRECTIONS}" )
fi

if [[ ! -z "${INPUT_RATE_LIMIT}" ]]; then
    echo "Max requests per second: ${INPUT_RATE_LIMIT}"
    args+=( "--rate-limit=${INPUT_RATE_LIMIT}" )
fi

if [[ ! -z "${INPUT_TIMEOUT}" ]]; then
    echo "Timeout for HTTP requests in seconds: ${INPUT_TIMEOUT}"
    args+=( "--timeout=${INPUT_TIMEOUT}" )
fi

if [[ ! -z "${INPUT_VERBOSE}" ]]; then
    echo "Show successful results too"
    args+=( "-v" )
fi

if [[ ! -z "${INPUT_SKIP_TLS_VERIFICATION}" ]]; then
    echo "Skip TLS certificate verification"
    args+=( "--skip-tls-verification" )
fi


if [[ ! -z "${INPUT_ONE_PAGE_ONLY}" ]]; then
    args+=( "--one-page-only" )
    echo "One page only ${args}"
fi

if [[ ! -z "${INPUT_COLOR}" ]]; then
    echo "Color output (default: auto)"
    args+=( "--color=${INPUT_COLOR}" )
fi

if [[ ! -z "${INPUT_HELP}" ]]; then
    echo "Show help"
    args+=( "--help" )
fi

if [[ ! -z "${INPUT_VERSION}" ]]; then
    echo "Show version"
    args+=( "--version" )
fi

/muffet "${args[@]}" $@