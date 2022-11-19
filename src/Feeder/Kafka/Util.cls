Class Feeder.Kafka.Util
{

ClassMethod ConnectSettings(ByRef settings, pConsumerFlag = 0) As %Status
{
 Set settings = ##class(%External.Messaging.KafkaSettings).%New()
 Set settings.username = "amandasmith"
 Set settings.password = "234sdsge"
 Set settings.servers = "100.0.70.179:9092, 100.0.70.089:7070"
 Set settings.clientId = "BazcoApp"
 // If Consumer, specify a consumer group
 If pConsumerFlag Set settings.groupId = "G1"
 Quit $$$OK
}

ClassMethod CreateClient() As %Status
{
 Set tSC = ..ConnectSettings(.settings)
 If $$$ISERR(tSC) {  }
 Set client = ##class(%External.Messaging.Client).CreateClient(settings, .tSC)
 If $$$ISERR(tSC) {  }
 Quit tSC
}

}
