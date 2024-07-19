# Convenience functions reusable in any shell context (i.e., not dependent on
# script-specific environment variables)

# Suppress warnings about expression-checking against literal strings
# We do this intentionally to check whether a word is an element in an array
# shellcheck disable=SC2076

[[ -n "$LIBGITPROFILE_COMMON_SH" ]] && return

LIBGITPROFILE_COMMON_SH=1

array_append_msg() {
  local -rn _arr="$1"
  local -r _msg="${*:2}"

  _arr+=("$_msg")
}
