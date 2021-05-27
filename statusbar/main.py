#!/usr/bin/python3.9

from datetime import datetime
from subprocess import run
from time import sleep
from typing import cast

from modules import (
    date,
    dnd,
    github,
    layout,
    module,
    temperature,
    usage,
    volume,
    webcam,
)

modules = [
    module.StandardModule(update_function=usage.ram_usage),
    module.StandardModule(update_function=usage.cpu_usage),
    module.StandardModule(update_function=temperature.cpu_temp, update_interval=2),
    module.StandardModule(update_function=temperature.gpu_temp, update_interval=2),
    module.StandardModule(update_function=temperature.ssd_temp, update_interval=2),
    module.StandardModule(update_function=temperature.hdd_temp, update_interval=2),
    module.TailModule("./scripts/volume.sh", update_function=volume.volume),
    module.StandardModule(update_function=webcam.webcam),
    module.TailModule("s_dnd", update_function=dnd.dnd),
    module.TailModule("./scripts/github.sh", update_function=github.github),
    module.StandardModule(update_function=layout.layout, update_interval=0.5),
    module.StandardModule(update_function=date.date),
    module.StandardModule(update_function=date.time),
]


def update_bar():
    status: str = ""
    for module in modules:
        val: str = ""

        if module.next_update_time == None or datetime.now() < cast(
            datetime, module.next_update_time
        ):
            val = module.get()
        else:
            val = module.update()

        if val == "":
            continue

        if status == "":
            status = f"{val}"
        else:
            status = f"{status} | {val}"

    if not status == "":
        run(["xsetroot", "-name", status])
        # print(status)


while True:
    update_bar()
    sleep(0.1)
