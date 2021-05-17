from dataclasses import dataclass
from typing import Any, Optional, cast
from datetime import datetime, timedelta
from threading import Thread
from subprocess import Popen, PIPE


@dataclass
class StandardModule:
    update_function: Any = None
    update_interval: Optional[float] = 1
    next_update_time: Optional[datetime] = None
    val: str = ""

    def __post_init__(self):
        self.next_update_time = datetime.now()

    def update_time(self):
        if self.update_interval == None:
            self.next_update_time = None
        else:
            self.next_update_time = datetime.now() + timedelta(
                seconds=cast(float, self.update_interval)
            )

    def update(self) -> str:
        self.update_time()
        self.val = self.update_function()
        return self.val

    def get(self) -> str:
        return self.val


class TailModule(StandardModule, Thread):
    def __init__(self, command: str, update_function: Any = None):
        StandardModule.__init__(self)
        Thread.__init__(self)
        self.update_interval = None
        self.next_update_time = None
        self.update_function = update_function
        self.__proc = Popen(command, stdout=PIPE, shell=True)
        self.start()

    def get(self) -> str:
        return self.update_function(self.val)

    def __eq__(self, other):
        return self is other

    def __hash__(self):
        return hash(id(self))

    def run(self):
        while True:
            line = self.__proc.stdout.readline().decode("utf-8").strip()
            if not line:
                continue
            self.val = line
