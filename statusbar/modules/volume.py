from . import utils

def volume(level: str) -> str:
    try:
        vol=level.split()
        if vol.__len__() == 2:
            muted = True if vol[0] == "MUTED" else False
            lvl = vol[1]
        else:
            muted = False
            lvl = vol[0] if vol.__len__() > 0 else 0

        lvl = int(lvl)

        icon = utils.VOLUME_MUTED_ICON if muted else utils.VOLUME_ICON

        if lvl <= 65:
            vol=f"{icon} {lvl}"
        elif lvl > 65 and lvl <= 85:
            vol=f"{utils.FG_YELLOW}{icon} {lvl}{utils.FG_NORMAL}"
        else:
            vol=f"{utils.FG_RED}{icon} {lvl}{utils.FG_NORMAL}"
    except ValueError:
        vol = f"{utils.VOLUME_ICON} X"
    return vol
