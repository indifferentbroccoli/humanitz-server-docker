#!/bin/bash
# shellcheck source=scripts/functions.sh
source "/home/steam/server/functions.sh"

SERVER_FILES="/home/steam/server-files"

cd "$SERVER_FILES" || exit

LogAction "Starting HumanitZ Dedicated Server"

PORT="${PORT:-7777}"
QUERY_PORT="${QUERY_PORT:-27015}"

EXEC="$SERVER_FILES/HumanitZServer.sh"

if [ ! -f "$EXEC" ]; then
    LogError "Could not find server executable at: $EXEC"
    exit 1
fi

chmod +x "$EXEC"
LogInfo "Server starting on port ${PORT} (UDP), query port ${QUERY_PORT} (UDP)"

exec "$EXEC" \
    -port="${PORT}" \
    -queryport="${QUERY_PORT}"
