#!/bin/bash

# T&M Hansson IT AB © - 2020, https://www.hanssonit.se/

# shellcheck disable=2034,2059
true
SCRIPT_NAME="Not-supported Menu"
# shellcheck source=lib.sh
. <(curl -sL https://raw.githubusercontent.com/nextcloud/vm/master/lib.sh)

# Check for errors + debug code and abort if something isn't right
# 1 = ON
# 0 = OFF
DEBUG=0
debug_mode

# Must be root
root_check

# Main menu
choice=$(whiptail --title "$TITLE" --checklist \
"This is the Not-supported Menu of the Nextcloud VM!

Please note that all options that get offered to you are not part of the released version and thus not 100% ready.
So please run them on your own risk. Feedback is more than welcome, though and can get reported here: $ISSUES

Choose which one you want to execute.
$CHECKLIST_GUIDE" "$WT_HEIGHT" "$WT_WIDTH" 4 \
"SMB-server" "(Create and manage a SMB-server on OS level)" OFF 3>&1 1>&2 2>&3)

case "$choice" in
    *"SMB-server"*)
        print_text_in_color "$ICyan" "Downloading the SMB Server script..."
        run_script NOT_SUPPORTED smbserver
    ;;&
    *)
    ;;
esac
exit