Intersystems IRIS platform
Queue monitoring
1. Overview
With the gradual improvement of hospital information construction, there are more and more business interfaces in hospitals. Due to the influence of various factors (network, consumer system, etc.), the data processing of business interface may cause excessive message accumulation and even the situation of interface card congestion, which affects the normal business development in the hospital. Therefore, the monitoring of the queue of business interface components becomes more and more important.
At present, the built-in queue monitoring interface of Intersystems IRIS platform only displays real-time queue information of interface components. When a large number of component queues are accumulated, the time node and event ID of the queue generation cannot be quickly located. Therefore, the queue data information required for practical application scenarios in hospitals is limited. The queue monitoring component program is developed based on the Intersystems IRIS platform. It monitors all interface components in production in a unified manner and displays the queue trend chart of components within 24 hours. You can also query the historical queue data of components by setting a time period to better meet the current application requirements in the hospital.

Key applications: IRIS, Python
2. Technical Specifications
2.1. Python
3. Application introduction
3.1. Function Introduction
By configuring this program component, you can realize real-time unified monitoring of message queues of production and operation components in Intersystems IRIS platform and display the current 24h queue trend of service interface components. You can also display the historical queue trend in a specified time range. You can use component history queue data to analyze whether the current service interface component configuration is reasonable and whether it needs to be optimized. Based on the trend analysis of the historical queue data, focus on the components with frequent queue generation. If an accident is caused by a queue problem, you can use the trend chart to quickly locate the start time of the queue and ID of the service event, which reduces the troubleshooting time and greatly improves the troubleshooting efficiency.
3.2. Future Application Scenarios
1. Configure the running pool of the intelligent optimized component
2. Queue monitoring alarms
3. Highlight the top5 in the queue
4. Collect statistics on the frequency of component queue problems
3.3. Program deployment
