import psutil, json
from operator import itemgetter
from time import sleep, time


NET_IF = 'nordlynx'

def get_l1_proc(process):
    while True:
        parent = process.parent()
        if parent is None or parent.pid == 1:
            break
        process = parent
    return process.pid

def add(a, b):
    if a is None:
        return b
    if b is None:
        return a
    return {k: a[k] + b[k] for k in a.keys()}

def mem_str(v):
    if v > 2**30:
        return "{:.2f}GB".format(v / 2**30)
    if v > 2**20:
        return "{:.2f}MB".format(v / 2**20)
    if v > 2**10:
        return "{:.2f}KB".format(v / 2**10)
    return "{:.2f}B".format(v)

def transform(l):
    return [
        psutil.Process(l["pid"]).name(),
        l["num_threads"],
        l["cpu_percent"] / 8,
        mem_str(l["mem"])
    ]

def top_processes():
    lst = {}
    for proc in psutil.process_iter():
        try:
            # Fetch process details as dict
            pinfo = proc.as_dict(attrs=["num_threads", "cpu_percent"])
            # print(proc.cpu_percent(None))
            mem_info = proc.memory_full_info()
            pinfo["mem"] = mem_info.pss + mem_info.uss
            # Append dict to list
            pid = get_l1_proc(proc)
            # print(pid, proc.pid, mem_str(pinfo['mem']))
            lst[pid] = add(lst.get(pid), pinfo)
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass
    lst = [{'pid': pid, **lst[pid]} for pid in lst]
    lst = sorted(lst, key=itemgetter('cpu_percent', 'mem'))[::-1]
    return [transform(l) for l in lst[:8]]

def main():
    while True:
        print(json.dumps(top_processes()))
        


if __name__ == "__main__":
    main()
