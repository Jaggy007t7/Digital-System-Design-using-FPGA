from pynq.overlays.base import BaseOverlay
from pynq.lib.pmod import Pmod_IO
import time

# Load overlay
base = BaseOverlay("base.bit")

# PMODB pin 1 -> index 0
led = Pmod_IO(base.PMODB, 0, 'out')

# Blink 20 times
for i in range(20):
    led.write(1)
    print("ON")
    time.sleep(0.5)

    led.write(0)
    print("OFF")
    time.sleep(0.5)
