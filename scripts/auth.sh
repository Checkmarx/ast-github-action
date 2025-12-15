#!/bin/bash

# ------------------------------------------------------
# Logic: Handle Registry Authentication
# ------------------------------------------------------

if [[ -n "$REGISTRIES" ]]; then
    echo "🔑 Creating multi-registry auth.json..."
    mkdir -p /github/home/.config/containers
    auths_entries=""

    for reg in $REGISTRIES; do
        # Convert registry to env var friendly form (dots & dashes to underscores, uppercase)
        env_suffix=$(echo "$reg" | tr '.-' '_' | tr '[:lower:]' '[:upper:]')

        user_var="USERNAME_${env_suffix}"
        pass_var="PASSWORD_${env_suffix}"

        user="${!user_var}"
        pass="${!pass_var}"

        if [[ -n "$user" && -n "$pass" ]]; then
            encoded=$(echo -n "${user}:${pass}" | base64 -w0)
            auths_entries+="\"$reg\": {\"auth\": \"$encoded\"},"
            echo "✅ Added credentials for $reg"
        else
            echo "⚠️  Skipping $reg — missing username/password"
        fi
    done

    # Remove trailing comma and wrap in JSON
    auths_entries="${auths_entries%,}"
    echo "{\"auths\": {${auths_entries}}}" > /github/home/.config/containers/auth.json
    echo "✅ Auth.json created at /github/home/.config/containers/auth.json"
else
    echo "⚠️  No REGISTRIES specified, skipping auth.json creation."
fi
