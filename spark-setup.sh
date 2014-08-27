cd $OPENSHIFT_DATA_DIR
export SPARK_MASTER_IP=$OPENSHIFT_DIY_IP
export SPARK_MASTER_PORT=17077
export SPARK_WORKER_WEBUI_PORT=8080
export SPARK_WORKER_PORT=17078
export SPARK_WORKER_IP=$OPENSHIFT_DIY_IP
export SPARK_UI_HOST=$OPENSHIFT_DIY_IP
if ["$SPARK_INIT" = "1"]
then
  fi
  wget http://www.us.apache.org/dist/spark/spark-1.0.2/spark-1.0.2-bin-hadoop2.tgz
  tar zxf spark-1.0.2-bin-hadoop2.tgz
  rm -rf spark-1.0.2-bin-hadoop2.tgz
  rm -rf spark-1.0.2-bin-hadoop2/lib/spark-assembly-1.0.2-hadoop2.2.0.jar
  wget -P spark-1.0.2-bin-hadoop2/lib https://jobpassion2-80.terminal.com/spark-assembly-1.0.2-hadoop2.2.0.jar
  export SPARK_INIT=1
  echo "export SPARK_INIT=1">>$OPENSHIFT_DATA_DIR/.bash_profile
  
  cd spark-1.0.2-bin-hadoop2
  if [master="1"]
  then
    #start master
    #sbin/start-master.sh
  else
    #start worker
    #sbin/start
  fi
fi
cd $OPENSHIFT_DATA_DIR/spark-1.0.2-bin-hadoop2
sbin/start-slave.sh --master spark://$OPENSHIFT_DIY_IP:17077
