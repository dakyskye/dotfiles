from . import utils


def dnd(status: str) -> str:
    return (
        f"{utils.FG_RED}{utils.DND_ON_ICON} {status}{utils.FG_NORMAL}"
        if status == "DND"
        else f"{utils.DND_OFF_ICON} {status}"
    )
