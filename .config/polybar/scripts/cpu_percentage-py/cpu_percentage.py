#!/usr/bin/env python3
import psutil

allCores = psutil.cpu_percent(percpu=True, interval=1)
for core in allCores:
    print(format(format(core, '0.2f'), '.4s')+"% ", end=" ", flush=True)