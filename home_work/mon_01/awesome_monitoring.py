import re
import json
import os
from datetime import datetime

PROC_STAT_FILE='/proc/stat'
PROC_MEMINFO_FILE='/proc/meminfo'
ALL_METRICS = {}
TOD = datetime.today().strftime('%y-%m-%d')

def get_proc_stat():
	process_re = r"processes\s(\d+)"	
	process_running_re = r"procs_running\s(\d+)"
	
	f = open(PROC_STAT_FILE, 'r')
	stat = f.read()
	f.close()	
	
	m = re.search(process_re, stat)
	ALL_METRICS['processes'] = m.group(1)
	m = re.search(process_running_re, stat)
	ALL_METRICS['procs_running'] = m.group(1)

def get_proc_meminfo():
	mem_total_re = r"MemTotal:\s+(\d+)"	
	mem_free_re= r"MemFree:\s+(\d+)"
	mem_available_re= r"MemAvailable:\s+(\d+)"	

	f = open(PROC_MEMINFO_FILE, 'r')
	meminfo = f.read()
	f.close()	

	m = re.search(mem_total_re, meminfo)
	ALL_METRICS['mem_total'] = m.group(1)
	m = re.search(mem_free_re, meminfo)
	ALL_METRICS['mem_free'] = m.group(1)	
	m = re.search(mem_available_re, meminfo)
	ALL_METRICS['mem_available'] = m.group(1)	

def write_metrics():

	logfile = "/var/log/" + TOD + "/" + TOD + "-awesome-monitoring.log"
	os.makedirs(os.path.dirname(logfile), exist_ok=True)

	# Serializing json
	json_object = json.dumps(ALL_METRICS)
	 
	# Writing to sample.json
	with open(logfile, "a+") as outfile:
		outfile.write(json_object)		
		outfile.write('\r\n')
	
if __name__ == '__main__':
	
	get_proc_stat()
	get_proc_meminfo()
	write_metrics()