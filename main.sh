
# abort if any command fails
set -e
# if any command in a pipeline fails, fail the whole command
set -o pipefail

. script1.sh
. script2.sh
. script3.sh

