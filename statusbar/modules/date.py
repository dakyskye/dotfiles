from datetime import datetime
from . import utils

def date() -> str:
    now = datetime.now()
    return f"{utils.DATE_ICON} {now.strftime('%a %d.%m.%Y')}"

def time() -> str:
    now = datetime.now()
    return f"{utils.TIME_ICON} {now.strftime('%H:%M')}"
