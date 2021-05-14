import psutil
from . import utils

def cpu_temp() -> str:
    temp = round(psutil.sensors_temperatures()['k10temp'][0].current)

    if temp <= 45:
        ret = f"C {utils.TEMPERATURE_ICON} {temp}"
    elif temp > 45 and temp <= 70:
        ret = f"{utils.FG_YELLOW}C {utils.TEMPERATURE_ICON} {temp}"
    else:
        ret = f"{utils.FG_RED}C {utils.TEMPERATURE_ICON} {temp}"

    return f"{ret}{utils.CELSIUS_ICON}{utils.FG_NORMAL}"

def gpu_temp() -> str:
    temp = round(psutil.sensors_temperatures()['amdgpu'][0].current)

    if temp <= 45:
        ret = f"G {utils.TEMPERATURE_ICON} {temp}"
    elif temp > 45 and temp <= 70:
        ret = f"{utils.FG_YELLOW}G {utils.TEMPERATURE_ICON} {temp}"
    else:
        ret = f"{utils.FG_RED}G {utils.TEMPERATURE_ICON} {temp}"

    return f"{ret}{utils.CELSIUS_ICON}{utils.FG_NORMAL}"

def ssd_temp() -> str:
    temp = round(psutil.sensors_temperatures()['drivetemp'][0].current)

    if temp <= 40:
        ret = f"S {utils.TEMPERATURE_ICON} {temp}"
    elif temp > 40 and temp <= 50:
        ret = f"{utils.FG_YELLOW}S {utils.TEMPERATURE_ICON} {temp}"
    else:
        ret = f"{utils.FG_RED}S {utils.TEMPERATURE_ICON} {temp}"

    return f"{ret}{utils.CELSIUS_ICON}{utils.FG_NORMAL}"

def hdd_temp() -> str:
    temp = round(psutil.sensors_temperatures()['drivetemp'][1].current)

    if temp <= 35:
        ret = f"H {utils.TEMPERATURE_ICON} {temp}"
    elif temp > 35 and temp <= 50:
        ret = f"{utils.FG_YELLOW}H {utils.TEMPERATURE_ICON} {temp}"
    else:
        ret = f"{utils.FG_RED}H {utils.TEMPERATURE_ICON} {temp}"

    return f"{ret}{utils.CELSIUS_ICON}{utils.FG_NORMAL}"
