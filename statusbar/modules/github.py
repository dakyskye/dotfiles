from . import utils


def github(amount: str) -> str:
    try:
        a = int(amount)
        if a > 0:
            a = f"{utils.FG_RED}{utils.GH_ICON} {a}{utils.FG_NORMAL}"
        else:
            a = f"{utils.GH_ICON} {a}"
    except ValueError:
        a = f"{utils.GH_ICON} X"
    return a
