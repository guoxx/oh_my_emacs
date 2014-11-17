set LS_HOME="D:\java_tools\logstash-1.4.1"
:: logstash-1.4.1\bin\logstash.bat agent -f logstash-conf/checkmap_result.conf
:: logstash-1.4.1\bin\logstash.bat agent -f logstash-conf/fps_summary.conf
:: logstash-1.4.1\bin\logstash.bat agent -f logstash-conf/log.conf
:: logstash-1.4.1\bin\logstash.bat agent -f logstash-conf/memory_leak.conf
:: logstash-1.4.1\bin\logstash.bat agent -f logstash-conf/json.conf


logstash-1.4.1\bin\logstash.bat agent -f logstash-conf/bm_auto_test.conf
