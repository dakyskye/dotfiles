from . import utils
from subprocess import run, CalledProcessError

def webcam() -> str:
    try:
        run(['fuser', '-s', '/dev/video0']).check_returncode()
        ret = f"{utils.FG_RED}{utils.WEBCAM_ICON} on{utils.FG_NORMAL}"
    except CalledProcessError:
        ret = f"{utils.WEBCAM_ICON} off"

    return ret
