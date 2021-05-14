from . import utils
from subprocess import check_output

def layout() -> str:
    return f"{utils.KEYBOARD_ICON} {check_output(['xkblayout-state', 'print', '%s']).decode('utf-8').strip()}"
