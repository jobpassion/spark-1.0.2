cd $OPENSHIFT_DATA_DIR
wget http://www.us.apache.org/dist/spark/spark-1.0.2/spark-1.0.2-bin-hadoop2.tgz
tar zxf spark-1.0.2-bin-hadoop2.tgz
rm -rf spark-1.0.2-bin-hadoop2.tgz
export SPARK_MASTER_IP=$OPENSHIFT_DIY_IP
export SPARK_MASTER_PORT=17077
export SPARK_WORKER_WEBUI_PORT=8080
export SPARK_UI_HOST=$OPENSHIFT_DIY_IP
rm -rf spark-1.0.2-bin-hadoop2/lib/spark-assembly-1.0.2-hadoop2.2.0.jar
wget -P spark-1.0.2-bin-hadoop2/lib https://jobpassion2-80.terminal.com/spark-assembly-1.0.2-hadoop2.2.0.jar
