import syslog
import time 
def main():
	syslog.openlog(ident="alive", logoption=syslog.LOG_PID,facility=syslog.LOG_USER)
	while True:
		syslog.syslog(syslog.LOG_INFO, "I am alive")
		time.sleep(10)

if __name__ == "__main__":
    main()
