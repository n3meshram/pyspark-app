from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("DemoApp").getOrCreate()

data = [("Nitin", 30), ("AWS", 5), ("DevOps", 7)]
df = spark.createDataFrame(data, ["Name", "Value"])

df.show()

spark.stop()