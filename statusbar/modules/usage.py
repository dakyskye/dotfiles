import psutil
from typing import cast
from . import utils

def ram_usage() -> str:
    val = psutil.virtual_memory()
    val = cast(float, val.percent)

    if val <= 40:
        ret = f'{utils.RAM_ICON} {val}%{utils.FG_NORMAL}'
    elif val > 40 and val <= 70:
        ret = f'{utils.FG_YELLOW}{utils.RAM_ICON} {val}%{utils.FG_NORMAL}'
    else:
        ret = f'{utils.FG_RED}{utils.RAM_ICON} {val}%{utils.FG_NORMAL}'

    return ret

def cpu_usage() -> str:
    val = psutil.cpu_percent()
    val = cast(float, val)

    if val <= 40:
        ret = f'{utils.CPU_ICON} {val}%{utils.FG_NORMAL}'
    elif val > 40 and val <= 70:
        ret = f'{utils.FG_YELLOW}{utils.CPU_ICON} {val}%{utils.FG_NORMAL}'
    else:
        ret = f'{utils.FG_RED}{utils.CPU_ICON} {val}%{utils.FG_NORMAL}'

    return ret
